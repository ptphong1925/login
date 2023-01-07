class SessionController < ApplicationController

  skip_before_action :authenticate_user!
  #skip_after_action :verify_authorized

  def create 
    @person = User.find_by(username: params[:username])
    @person = Admin.find_by(username: params[:username]) if @person.nil?
    if @person && @person.authenticate(params[:password])
      session[:token_user] = JsonWebToken.encode(@person)
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
  private
  def signin_params
    params.permit(:username, :password)
  end
end
