class HashtagJob < ApplicationJob
  queue_as :default

  def perform
    HashtagService.run
  end
end