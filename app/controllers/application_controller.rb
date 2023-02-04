class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  # skip_before_action :authenticate_user!
  # skip_after_action :verify_authorized
  before_action :authenticate_user!
  # before_action :update_last_seen_at, if: -> { user_signed_in? && (!current_user.admin?) && (current_user.last_seen_at.nil? || current_user.last_seen_at < ENV["LAST_SEEN_AT"].to_i.minutes.ago) }
  before_action :set_paper_trail_whodunnit
  #after_action :verify_authorized

  helper_method :user_signed_in?, :current_user
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  
  rescue_from JWT::ExpiredSignature, JWT::VerificationError do |exception|
    session[:token_user] = nil
    redirect_to signin_path
  end
  def current_user
    if session[:token_user]
      @current_user ||= CurrentUser.find_by(session[:token_user])
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
end


# before_action :authenticate_user!, except: :new
# before_action :set_user, only: %i[ show edit update destroy ]

# before_action(only: [:show, :edit, :update, :destroy]) { authorize @user }
# after_action(only: [:index]) { authorize @users }
# after_action(only: [:new, :create]) { authorize @user }

# def some_code_1
#   # some code
# end

# def some_code_2
#   # some code
# end


# def create
#   some_code_1
#   rescue Savon::Error => e
#     some_code_2
#     @retry_count += 1
#     if RETRY_MAX_COUNT > @retry_count
#       SfRelatedLead.update_after_converted_on_sf(call_target, current_client)
#       retry
#     else
#       raise XXCLASS, 'xx error'
#     end
#   end
# end



# Rspec.describe 'create method' do
#   describe 'create' do
#     begin
#       it 'no-exception' do
#         expect(create).not_to raise_error(Savon::Error)
#       end
#     rescue Savon::Error
#       begin
#         it 'retry exception' do
#           expect(create).not_to raise_error(Savon::Error)
#         end
#       rescue XXCLASS
#         it 'fail retry' do
#           expect(create).to raise_error(XXCLASS)
#         end
#       end
#     end
#   end
# end

