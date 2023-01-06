class Api::V1::ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  include Pundit::Authorization
  include Pagy::Backend
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_authorized
  before_action :authenticate_user!
  before_action :update_last_seen_at, if: -> { user_signed_in? && (!current_user.admin?) && (current_user.last_seen_at.nil? || current_user.last_seen_at < ENV["LAST_SEEN_AT_THRESHOLD"].to_i.minutes.ago) }
  before_action :set_paper_trail_whodunnit
  #after_action :verify_authorized

  # helper_method :user_signed_in?, :current_user
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  

  def current_user
    if token_user = request.headers['Authorization'].split(" ").last
      begin
        person_id, person_role = JsonWebToken.decode(token_user)
        case person_role
        when "Admin"
          @current_user ||= Admin.find(person_id)
        when "User"
          @current_user ||= User.find(person_id)
        end

      rescue JWT::ExpiredSignature, JWT::VerificationError
        params[:token_user] = nil
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
    current_user.update_attribute(:last_seen_at, Time.now)
  end

  private

  def user_not_authorized(exception)
    flash[:notice] = "You are not authorized to perform this action."
    head 404
  end
  
  
  # before_action :authenticate_user!, except: :new
  # before_action :set_user, only: %i[ show edit update destroy ]
  
  # before_action(only: [:show, :edit, :update, :destroy]) { authorize @user }
  # after_action(only: [:index]) { authorize @users }
  # after_action(only: [:new, :create]) { authorize @user }
end