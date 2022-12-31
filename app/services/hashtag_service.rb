class HashtagService < ApplicationService

  HASHTAG_REGEX = /[ ][#][\w]+/i

  def self.create_hashtag(text)
      hashtags = text.scan(HASHTAG_REGEX).uniq
      hashtags.each do |hashtag|
          if Hashtag.pluck(:name).include?(hashtag)
              Hashtag.where(name: hashtag).increment!
          else
              new_hashtag = Hashtag.create(name: hashtag)
              new_hashtag.increment!(:hashtags_count, 1)
          end
      end
  end

  def self.update_hashtag(text)
  end
  
end