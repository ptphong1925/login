class HashtagService < ApplicationService

  HASHTAG_REGEX = /[ ][#][\w]+/i

  def self.run
    comments = Comment.where('created_at > ?', Time.now - 5.minutes).pluck(:content)
    comments.each { |content| self.create_hashtag(content) }
    subcomments = Subcomment.where('created_at > ?', Time.now - 5.minutes).pluck(:content)
    subcomments.each { |content| self.create_hashtag(content) }
  end

  def self.create_hashtag(text)
    hashtags = text.scan(HASHTAG_REGEX).uniq
    hashtags.each do |hashtag|
      if Hashtag.pluck(:name).include?(hashtag)
        hashtag = Hashtag.find_by_name(hashtag)
        hashtag.increment!(:hashtags_count, 1)
      else
        new_hashtag = Hashtag.create(name: hashtag)
        new_hashtag.increment!(:hashtags_count, 1)
      end
    end
  end

  def self.update_hashtag(text)
  end
  
end