class FeedService

  def self.create
    total_feed = 20
    (Article.all).sample(total_feed)
  end

end