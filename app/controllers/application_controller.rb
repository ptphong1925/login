class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_authorized
  before_action :authenticate_user!
  before_action :update_last_seen_at, if: -> { user_signed_in? && (!current_user.admin?) && (current_user.last_seen_at.nil? || current_user.last_seen_at < ENV["LAST_SEEN_AT_THRESHOLD"].to_i.minutes.ago) }
  before_action :set_paper_trail_whodunnit
  #after_action :verify_authorized

  helper_method :user_signed_in?, :current_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  

  def current_user
    if session[:token_user]
      token = session[:token_user]
      hmac_secret = 'my$ecretK3y'
      token_person = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
      person_id = token_person[0]['person_id']
      person_role = token_person.first['person_role']
      
      case person_role
      when "Admin"
        Admin.find(person_id)
      when "User"
        User.find(person_id)
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

  def update_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
  end

  private

  def user_not_authorized(exception)
    flash[:notice] = "You are not authorized to perform this action."
    head 404
  end
end


# before_action :authenticate_user!, except: :new
# before_action :set_user, only: %i[ show edit update destroy ]

# before_action(only: [:show, :edit, :update, :destroy]) { authorize @user }
# after_action(only: [:index]) { authorize @users }
# after_action(only: [:new, :create]) { authorize @user }