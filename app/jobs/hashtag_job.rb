class HashtagJob < ApplicationJob
  queue_as :default

  def perform
    period = 5.minutes
    @comments = Comment.where('created_at >= ?', Time.now - period)
    @comments.pluck(:content).each do |content|
      HashtagService.create_hashtag(content)
    end
  end
end
