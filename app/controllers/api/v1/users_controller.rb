class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:create]
  skip_before_action :update_last_seen_at, only: [:create]
  skip_before_action :set_paper_trail_whodunnit
  before_action :set_user, only: %i[ show edit update destroy ]

  # serialization_scope :view_context

  # GET /users or /users.json
  def index
    @users = User.all.header_sort(params[:sort], params[:direction])
    render json: @users, status: :ok
  end

  # GET /users/1 or /users/1.json
  def show
    render json: { success: true, user: @user.as_json }, status: :created
  end

  # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  # def edit
  # end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :password_confirmation, :first_name, :last_name, :phone, :token_user, :email, :balance, :nation, :birtday)
    end
end
