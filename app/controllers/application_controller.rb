class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :logged_in?, :current_user
    def current_user
        if session[:token_user]
            token = session[:token_user]
            hmac_secret = 'my$ecretK3y'
            token_user = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
            user_id = token_user[0]['user_id']
            @user = User.find(user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        if !logged_in?
            redirect_to login_path
        end
    end
end
