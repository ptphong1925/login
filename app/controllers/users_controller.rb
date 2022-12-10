class UsersController < ApplicationController

  before_action :authenticate_user!, except: :new
  before_action :set_user, only: %i[ show edit update destroy ]

  before_action(only: [:show, :edit, :update, :destroy]) { authorize @user }
  after_action(only: [:index]) { authorize @users }
  after_action(only: [:new, :create]) { authorize @user }


  # GET /users or /users.json
  def index
    @users = FilterService.new(User.all)
    @users = @users.filer_by_keyword(params[:keyword], 'users.first_name', 'users.last_name', 'users.email', 'users.role')
  end

  # GET /users/1 or /users/1.json
  def show

  end

  # GET /users/new 
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        payload = { user_id: @user.id }
        hmac_secret = 'my$ecretK3y'
        token_user = JWT.encode(payload, hmac_secret, 'HS256')
        @user.update(token_user: token_user)
        session[:token_user] = token_user
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
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
      params.require(:user).permit(:username, :password_digest, :first_name, :last_name, :role, :token_user, :email, :visits, :orders_count, :lock_version)
    end
end
