class FeedService < ApplicationService

  def self.create
    total_feed = 5
    (Article.last(5)).sample(5)
  end

end