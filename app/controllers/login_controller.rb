class LoginController < ApplicationController
  skip_before_action :authorized
  def create 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = { user_id: @user.id }
      hmac_secret = 'my$ecretK3y'
      token_user = JWT.encode(payload, hmac_secret, 'HS256')
      @user.update(token_user: token_user)
      session[:token_user] = token_user
      redirect_to @user
    else
      redirect_to login_path
    end
  end
   
  def destroy
    session[:token_user] = nil
    redirect_to login_path
  end

  def login_params
    params.permit(:username, :password)
  end
end
