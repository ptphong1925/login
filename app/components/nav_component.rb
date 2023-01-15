# frozen_string_literal: true

class NavComponent < ViewComponent::Base
  def initialize(current_user:, user_signed_in:)
    @current_user = current_user
    @user_signed_in = user_signed_in
  end

end
