class AutobotService << ApplicationService

    def run_all
        run_comment
        run_subcomment
        run_like
        run_rate
        run_follow
        #need to be more
    end

    def run_comment
        person = (User.all + Admin.all).sample
        comment = person.comments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
        (Article.all + Song.all + Video.all).sample.comments << comment    
    end

    def run_subcomment
        person = (User.all + Admin.all).sample
        subcomment = person.subcomments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
        Comment.all.sample.subcomments << subcomment    
    end

    def run_like
        person = (User.all + Admin.all).sample
        like = person.likes.build
        (Article.all + Song.all + Video.all + Comment.all + Subcomment.all).sample.likes << like    
    end

    def run_follow
        person = (User.all + Admin.all).sample
        follow = person.followables.build
        (User.all + Admin.all).sample.followers << follow    
    end

    def run_rate
        person = (User.all + Admin.all).sample
        rate = person.rates.build(rate: rand(6))
        (Song.all + Book.all).sample.rates << rate    
    end

    def run_friend
        person = (User.all + Admin.all).sample
        friend = person.friendables.build(accepted?: [true, false].sample)
        (User.all + Admin.all).sample.frienders << friend    
    end
    
    def run_article
        person = (User.all + Admin.all).sample
        person.articles.build(title: Faker::GreekPhilosophers.quote, catalogue: Catalogue.pluck(:name).sample).save    
    end

    def run_song
        person = Singer.all.sample
        person.songs.build(title: Faker::Music.album, catalogue: Catalogue.pluck(:name).sample).save    
    end

    def run_video
        person = (User.all + Admin.all).sample
        person.videos.build(title: Faker::Movies::Hobbit.character, catalogue: Catalogue.pluck(:name).sample).save    
    end

end