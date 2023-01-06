class Api::V1::SessionController < Api::V1::ApiController
  skip_before_action :authenticate_user!
  def create
    @person = User.find_by(username: params[:username])
    @person = Admin.find_by(username: params[:username]) if @person.nil?
    if @person && @person.authenticate(params[:password])
      # session[:token_user] = JsonWebToken.encode(@person)
      # # session[:token_user] = token_person
      # flash[:notice] = "Đăng nhập thành công!!!"
      # redirect_to @person
      token_user = JsonWebToken.encode(@person)
    else  
      render json: { error: 'unauthorized' }, status: :unauthorized
    end

  end
end