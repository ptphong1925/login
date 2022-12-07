class SessionController < ApplicationController

  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def create 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = { user_id: @user.id }
      hmac_secret = 'my$ecretK3y'
      token_user = JWT.encode(payload, hmac_secret, 'HS256')
      @user.update(token_user: token_user)
      session[:token_user] = token_user
      flash[:notice] = "Đăng nhập thành công!!!"
      redirect_to @user
    else
      redirect_to signin_path
    end
  end
   
  def destroy
    session[:token_user] = nil
    flash[:notice] = "Đăng xuất thành công!!!"
    redirect_to root_path
  end
  private
  def signin_params
    params.permit(:username, :password)
  end
end
