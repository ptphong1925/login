# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


rails generate scaffold Catalogue name parent_id:integer
rails generate scaffold Nation name
rails generate scaffold Admin username password_digest first_name last_name phone token_user email balance:decimal nation birtday:datetime follows_count:integer
rails generate scaffold User username password_digest first_name last_name phone token_user email balance:decimal nation birtday:datetime follows_count:integer role
rails generate scaffold Supplier name catalogue
rails generate scaffold Book title status catalogue year_published:integer isbn:integer price:decimal out_of_print:boolean views_count:integer supplier:references user:references
rails generate scaffold Rate rate rater:references{polymorphic} rateable:references{polymorphic}
rails generate scaffold Article title content catalogue status poster:references{polymorphic} likes_count:integer
rails generate scaffold Song title content catalogue status poster:references{polymorphic} likes_count:integer
rails generate scaffold Video title content catalogue status poster:references{polymorphic} likes_count:integer
rails generate scaffold Comment content status commenter:references{polymorphic} commentable:references{polymorphic} likes_count:integer
rails generate scaffold Subcomment content status subcommenter:references{polymorphic} comment:references likes_count:integer
rails generate scaffold Like liker:references{polymorphic} likeable:references{polymorphic}
rails generate scaffold Follow follower:references{polymorphic} followable:references{polymorphic}
rails generate scaffold Friend friender:references{polymorphic} accepted?:boolean friendable:references{polymorphic}


#Profile = User#show
# rails generate scaffold Profile profiler:references{polymorphic}
# rails generate scaffold Location name parent_id:integer nation:references
# rails generate scaffold Orginazation name catalogue
#không nên dùng Post cho tất cả, vì mỗi chilrent là rất lớn
# rails generate scaffold Payment status
# rails generate scaffold Order status date_submited:time status:integer subtotal:decimal shipping:decimal tax:decimal total:decimal customer:references 
# rails generate scaffold Invoice
# rails generate scaffold Friendship
# rails generate scaffold Follow
# rails generate scaffold Group
# rails generate scaffold React role reacter:references{polymorphic} reactable:references{polymorphic}
# rails generate scaffold Report content catalogue reporter:references{polymorphic} reportable:references{polymorphic}
# rails generate scaffold Relation che me anh chi dong nghiep
# rails generate scaffold Event name adress time:datetime catalogue likes_count:integer
# rails generate scaffold Message role(two/many) messager content
# rails generate scaffold Statistic



50.times { Nation.create!( name: Faker::Nation.unique.nationality) }
5.times { |n| Admin.create!(username: "admin#{n+1}",
                            password: "password",
                            password_confirmation: "password",
                            first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            phone: Faker::PhoneNumber.cell_phone,
                            balance: Faker::Number.decimal(l_digits: 3, r_digits: 1),
                            nation: Nation.pluck(:name).sample,
                            birtday: Faker::Time.between(from: DateTime.now - 100.years, to: DateTime.now),
                            email: "admin#{n+1}@gmail.com",
                            ) }
20.times { |n| User.create!(username: "user#{n+1}",
                            password: "password",
                            password_confirmation: "password",
                            first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            phone: Faker::PhoneNumber.cell_phone,
                            balance: Faker::Number.decimal(l_digits: 3, r_digits: 1),
                            nation: Nation.pluck(:name).sample,
                            birtday: Faker::Time.between(from: DateTime.now - 100.years, to: DateTime.now),
                            email: "user#{n+1}@gmail.com",
                            role: ['basic', 'basic', 'basic', 'author', 'singer'].sample
                            ) }

10.times { Supplier.create!(name: Faker::Company.unique.name) }
5.times { Catalogue.create!(name: Faker::Games::Dota.unique.item) }
15.times { Catalogue.create!(name: Faker::Games::Dota.unique.item,
                            parent_id: Catalogue.pluck(:id).sample) }
20.times { Book.create!(title: Faker::Book.title,
                        catalogue: Catalogue.pluck(:name).sample,
                        year_published: rand(1800..2000),
                        isbn: Faker::Barcode.ean(8),
                        price: Faker::Number.decimal(l_digits: 2, r_digits: 1),
                        out_of_print: Faker::Boolean.boolean(true_ratio: 0.75),
                        supplier_id: Supplier.pluck(:id).sample,
                        status: ['pending','published'].sample,
                        user_id: Author.pluck(:id).sample ) }

#Article
20.times do
    person = (User.all + Admin.all).sample
    person.articles.build(title: Faker::GreekPhilosophers.quote, catalogue: Catalogue.pluck(:name).sample).save
end
#Song
20.times do
    person = Singer.all.sample
    person.songs.build(title: Faker::Music.album, catalogue: Catalogue.pluck(:name).sample).save
end
#Video
20.times do
    person = (User.all + Admin.all).sample
    person.videos.build(title: Faker::Movies::Hobbit.character, catalogue: Catalogue.pluck(:name).sample).save
end
#Comment
200.times do
    person = (User.all + Admin.all).sample
    comment = person.comments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    (Article.all + Song.all + Video.all).sample.comments << comment
end
#Subcomment
300.times do
    person = (User.all + Admin.all).sample
    subcomment = person.subcomments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    Comment.all.sample.subcomments << subcomment
end
#Like
500.times do
    person = (User.all + Admin.all).sample
    like = person.likes.build
    (Article.all + Song.all + Video.all + Comment.all + Subcomment.all).sample.likes << like
end
#Follow
500.times do
    person = (User.all + Admin.all).sample
    follow = person.followables.build
    (User.all + Admin.all).sample.followers << follow
end
#Friend
49.times do
    person = (User.all + Admin.all).sample
    friend = person.friendables.build(accepted?: [true, false].sample)
    (User.all + Admin.all).sample.frienders << friend
end
#Rate
200.times do
    person = (User.all + Admin.all).sample
    rate = person.rates.build(rate: rand(6))
    (Song.all + Book.all).sample.rates << rate
end










puts 'SEED done!!!!'
