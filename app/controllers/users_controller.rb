class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  # skip_before_action :update_last_seen_at
  skip_before_action :set_paper_trail_whodunnit
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all.header_sort(params[:sort], params[:direction])
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:token_user] = JsonWebToken.encode(@user)
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
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PUT /users/1/last_seen_at
  def last_seen_at
    if current_user.last_seen_at.nil? ||
      current_user.last_seen_at < ENV["LAST_SEEN_AT"].to_i.minutes.ago
      current_user.update(last_seen_at: Time.now - 30.seconds)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password_digest, :first_name, :last_name, :phone, :token_user, :email, :balance, :nation, :birtday, :follows_count, :last_seen_at, :role)
    end
end
