class Api::V1::SessionController < Api::V1::ApiController
  skip_before_action :authenticate_user!
  # skip_before_action :update_last_seen_at
  skip_before_action :set_paper_trail_whodunnit
  def create
    @person = User.find_by(username: params[:username])
    @person = Admin.find_by(username: params[:username]) if @person.nil?
    if @person && @person.authenticate(params[:password])
      @token_user = JsonWebToken.encode(@person)
      update_last_seen_at
      render json: { token_user: @token_user }, status: :ok
    # else  
    #   render json: { error: 'unauthorized' }, status: :unauthorized
    end

  end
end