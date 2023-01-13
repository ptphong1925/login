class SessionsController < ApplicationController

  skip_before_action :authenticate_user!
  #skip_after_action :verify_authorized
  def new
  end
  
  def create 
    @person = User.find_by(username: params[:username])
    @person = Admin.find_by(username: params[:username]) if @person.nil?
    if @person && @person.authenticate(params[:password])
      session[:token_user] = JsonWebToken.encode(@person)
      SigninMailer.new_signin(@person).deliver
      flash[:notice] = "Đăng nhập thành công!!!"
      redirect_to @person
    else  
      redirect_to signin_path
    end
  end
   
  def destroy
    session[:token_user] = nil
    flash[:notice] = "Đăng xuất thành công!!!"
    redirect_to root_path
  end

  def omniauth
    @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.email = auth[:info][:email]
      user.username = auth[:info][:email].split('@').first
      user.first_name = auth[:info][:first_name]
      user.last_name = auth[:info][:last_name]
      user.password = SecureRandom.hex(10)
      user.password_confirmation = user.password
    end
    if @user.valid?
      session[:token_user] = JsonWebToken.encode(@user)
      flash[:notice] = "Đăng nhập thành công!!!"
      redirect_to @user
    else
      flash[:notice] = 'Credential error'
      redirect_to signin_path
    end
  end

  private
  def signin_params
    params.permit(:username, :password)
  end
  def auth
    request.env['omniauth.auth']
  end

end
