# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# rails generate scaffold Admin username password_digest first_name last_name token_user email balance:decimal nation birtday:datetime deleted_at:datetime:index
# rails generate scaffold User username password_digest first_name last_name role token_user email balance:decimal nation birtday:datetime visits:integer orders_count:integer lock_version:integer deleted_at:datetime:index
# rails generate scaffold Supplier name deleted_at:datetime:index
# rails generate scaffold Book title catalogue year_published:integer isbn:integer price:decimal out_of_print:boolean views:integer supplier:references user:references deleted_at:datetime:index
# rails generate scaffold Catalogue name type parent_id:integer
# rails generate scaffold Rate rate rater:references{polymorphic} rateable:references{polymorphic}
# rails generate scaffold Post title content catalogue poster:references{polymorphic}
# rails generate scaffold Music title content catalogue poster:references{polymorphic}
# rails generate scaffold Video title content catalogue poster:references{polymorphic}
# rails generate scaffold Comment content commenter:references{polymorphic} commentable:references{polymorphic}
# rails generate scaffold Subcomment content commenter:references{polymorphic} comment:references
# rails generate scaffold Payment
# rails generate scaffold Order
# rails generate scaffold Invoice
# rails generate scaffold Friendship
# rails generate scaffold Follow
# rails generate scaffold Like liker:references{polymorphic} likeable:references{polymorphic}
# rails generate scaffold Report reporter:references{polymorphic} reportable:references{polymorphic}
# rails generate scaffold Relation che me anh chi dong nghiep
# rails generate scaffold Event name adress time:datetime catalogue
# rails generate scaffold Orginazation name country catalogue
# rails generate scaffold Message type(two/many) messager



# rails generate scaffold Review title body:text rating:integer state:integer customer:references book:references deleted_at:datetime:index
# rails generate scaffold Customer first_name last_name title email visits:integer orders_count:integer lock_version:integer deleted_at:datetime:index
# rails generate scaffold Order date_submited:time status:integer subtotal:decimal shipping:decimal tax:decimal total:decimal customer:references deleted_at:datetime:index

5.times { |n| Admin.create!(username: "admin#{n+1}",
                            password: "password",
                            password_confirmation: "password",
                            first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            email: "admin#{n+1}@gmail.com",
                            ) }
20.times { |n| User.create!(username: "user#{n+1}",
                            password: "password",
                            password_confirmation: "password",
                            first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            role: ['basic', 'basic', 'basic', 'author'].sample,
                            email: "user#{n+1}@gmail.com",
                            balance: Faker::Number.decimal(l_digits: 2, r_digits: 1),
                            visits: rand(100),
                            orders_count: rand(100),
                            lock_version: rand(10)) }

10.times { Supplier.create!(name: Faker::Games::Dota.hero) }
5.times { Catalogue.create!(name: Faker::Games::Dota.item) }
15.times { Catalogue.create!(name: Faker::Games::Dota.item,
                            parent_id: Catalogue.pluck(:id).sample }
20.times { Book.create!(title: Faker::Book.title,
                        catalogue: Catalogue.pluck(:name).sample,
                        year_published: rand(1800..2000),
                        isbn: Faker::Barcode.ean(8),
                        price: Faker::Number.decimal(l_digits: 2, r_digits: 1),
                        out_of_print: Faker::Boolean.boolean(true_ratio: 0.75),
                        views: rand(1000),
                        rate: rand(6),
                        supplier_id: Supplier.pluck(:id).sample,
                        user_id: Author.pluck(:id).sample ) }

#Post
20.times do
    person = (User.all + Admin.all).sample
    person.posts.build(title: Faker::GreekPhilosophers.quote, catalogue: Catalogue.pluck(:name).sample).save
end
#Musics
20.times do
    person = (User.all + Admin.all).sample
    person.musics.build(title: Faker::Music.album, catalogue: Catalogue.pluck(:name).sample).save
end
#Video
20.times do
    person = (User.all + Admin.all).sample
    person.videos.build(title: Faker::Movies::Hobbit.character, catalogue: Catalogue.pluck(:name).sample).save
end
200.times do
    person = (User.all + Admin.all).sample
    comment = person.comments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    comment.save
    (Post.all + Music.all + Video.all).sample.comments << comment
end
400.times do
    person = (User.all + Admin.all).sample
    subcomment = person.subcomments.build(content: [Faker::Games::Dota.quote, Faker::Movies::HarryPotter.quote, Faker::Movies::Hobbit.quote, Faker::Quote.yoda, Faker::Games::Witcher.quote].sample)
    subcomment.save
    (Post.all + Music.all + Video.all).sample.subcomments << subcomment
end
# User.all.each do |user|
#     Post.all.each do |post|
#         comment = user.comments.build(content: Faker::Games::Dota.quote)
#         post.comments << comment
#     end
# end
# User.all.each do |user|
#     Post.all.each do |post|
#         comment = user.comments.build(content: Faker::Movies::HarryPotter.quote)
#         post.comments << comment
#     end
# end
# Admin.all.each do |admin|
#     Post.all.each do |post|
#         comment = admin.comments.build(content: Faker::Movies::HarryPotter.quote)
#         post.comments << comment
#     end
# end








# 50.times { Order.create!(date_submited: Faker::Date.between(from: 50.days.ago, to: Date.today),
#                         status: rand(0..3),
#                         subtotal: Faker::Number.decimal(l_digits: 0, r_digits: 1),
#                         shipping: Faker::Number.decimal(l_digits: 2, r_digits: 1),
#                         tax: Faker::Number.decimal(l_digits: 0, r_digits: 1),
#                         total: Faker::Number.decimal(l_digits: 3, r_digits: 1),
#                         customer_id: rand(1..50)) }

# 100.times { Review.create!(title: Faker::Quote.singular_siegler,
#                         body: Faker::Quote.most_interesting_man_in_the_world,
#                         rating: rand(1..5),
#                         state: rand(0..2),
#                         customer_id: rand(1..50),
#                         book_id: rand(1..10)) }

puts 'SEED done!!!!'
