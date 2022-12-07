class ApplicationController < ActionController::Base

    include Pundit::Authorization
    # skip_before_action :authenticate_user!
    # skip_after_action :verify_authorized
    before_action :authenticate_user!
    after_action :verify_authorized

    helper_method :user_signed_in?, :current_user
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  

    def current_user
        if session[:token_person]
            token = session[:token_person]
            hmac_secret = 'my$ecretK3y'
            token_person = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
            person_id = token_person[0]['person_id']
            begin
                User.find(person_id)
            rescue ActiveRecord::RecordNotFound
                Admin.find(person_id)
            end
        end
    end

    def user_signed_in?
        !!current_user
    end

    def authenticate_user!
        if !user_signed_in?
            redirect_to signin_path
        end
    end

    private

    def user_not_authorized(exception)
        flash[:notice] = "You are not authorized to perform this action."
        head 404
    end
end
