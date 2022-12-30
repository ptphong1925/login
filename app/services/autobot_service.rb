class AutobotService < ApplicationService

  def self.run_all
    self.run_comment
    self.run_subcomment
    self.run_like
    # self.run_rate
    # self.run_follow
    # need to be more
  end

  def self.run_comment
    person = (User.all + Admin.all).sample
    comment = person.comments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    (Article.all + Song.all + Video.all).sample.comments << comment
  end

  def self.run_subcomment
    person = (User.all + Admin.all).sample
    subcomment = person.subcomments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    Comment.all.sample.subcomments << subcomment
  end

  def self.run_like
    person = (User.all + Admin.all).sample
    like = person.likes.build
    (Article.all + Song.all + Video.all + Comment.all + Subcomment.all).sample.likes << like    
  end

  def self.run_follow
    person = (User.all + Admin.all).sample
    follow = person.followables.build
    (User.all + Admin.all).sample.followers << follow
  end

  def self.run_rate
    person = (User.all + Admin.all).sample
    rate = person.rates.build(rate: rand(6))
    (Song.all + Book.all).sample.rates << rate
  end

  def self.run_friend
    person = (User.all + Admin.all).sample
    friend = person.friendables.build(accepted?: [true, false].sample)
    (User.all + Admin.all).sample.frienders << friend
  end

  def self.run_article
    person = (User.all + Admin.all).sample
    person.articles.build(title: Faker::GreekPhilosophers.quote, catalogue: Catalogue.pluck(:name).sample).save    
  end

  def self.run_song
    person = Singer.all.sample
    person.songs.build(title: Faker::Music.album, catalogue: Catalogue.pluck(:name).sample).save    
  end

  def self.run_video
    person = (User.all + Admin.all).sample
    person.videos.build(title: Faker::Movies::Hobbit.character, catalogue: Catalogue.pluck(:name).sample).save    
  end

end