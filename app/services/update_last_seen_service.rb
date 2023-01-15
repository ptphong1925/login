class UpdateLastSeenService < ApplicationService
  LAST_SEEN_AT_THRESHOLD = 5
  def self.run(user)
    if user_signed_in? &&
       (!current_user.admin?) && (current_user.last_seen_at.nil? || current_user.last_seen_at < ENV["LAST_SEEN_AT_THRESHOLD"].to_i.minutes.ago)
    current_user.update_attribute(:last_seen_at, Time.now)
  end
end