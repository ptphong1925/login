# frozen_string_literal: true

class LastSeenAtComponent < ViewComponent::Base
  def initialize(current_user:, user_signed_in:)
    @current_user = current_user
    @user_signed_in = user_signed_in
    #setInterval unit: milisecond
    @time_setinterval = ENV['LAST_SEEN_AT'].to_i.minutes.in_seconds*1000
  end

end
