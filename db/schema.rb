# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_22_145222) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "token_user"
    t.string "email"
    t.decimal "balance"
    t.string "nation"
    t.datetime "birtday"
    t.integer "follows_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "catalogue"
    t.string "status"
    t.string "poster_type", null: false
    t.integer "poster_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_type", "poster_id"], name: "index_articles_on_poster"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.string "catalogue"
    t.integer "year_published"
    t.integer "isbn"
    t.decimal "price"
    t.boolean "out_of_print"
    t.integer "views_count"
    t.integer "supplier_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_books_on_supplier_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "catalogues", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.string "status"
    t.string "commenter_type", null: false
    t.integer "commenter_id", null: false
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["commenter_type", "commenter_id"], name: "index_comments_on_commenter"
  end

  create_table "follows", force: :cascade do |t|
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower"
  end

  create_table "friends", force: :cascade do |t|
    t.boolean "accepted?"
    t.string "friender_type", null: false
    t.integer "friender_id", null: false
    t.string "friendable_type", null: false
    t.integer "friendable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendable_type", "friendable_id"], name: "index_friends_on_friendable"
    t.index ["friender_type", "friender_id"], name: "index_friends_on_friender"
  end

  create_table "likes", force: :cascade do |t|
    t.string "liker_type", null: false
    t.integer "liker_id", null: false
    t.string "likeable_type", null: false
    t.integer "likeable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["liker_type", "liker_id"], name: "index_likes_on_liker"
  end

  create_table "nations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string "rate"
    t.string "rater_type", null: false
    t.integer "rater_id", null: false
    t.string "rateable_type", null: false
    t.integer "rateable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable"
    t.index ["rater_type", "rater_id"], name: "index_rates_on_rater"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "catalogue"
    t.string "status"
    t.string "poster_type", null: false
    t.integer "poster_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_type", "poster_id"], name: "index_songs_on_poster"
  end

  create_table "subcomments", force: :cascade do |t|
    t.string "content"
    t.string "status"
    t.string "subcommenter_type", null: false
    t.integer "subcommenter_id", null: false
    t.integer "comment_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_subcomments_on_comment_id"
    t.index ["subcommenter_type", "subcommenter_id"], name: "index_subcomments_on_subcommenter"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "catalogue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "token_user"
    t.string "email"
    t.decimal "balance"
    t.string "nation"
    t.datetime "birtday"
    t.integer "follows_count"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "catalogue"
    t.string "status"
    t.string "poster_type", null: false
    t.integer "poster_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poster_type", "poster_id"], name: "index_videos_on_poster"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "books", "suppliers"
  add_foreign_key "books", "users"
  add_foreign_key "subcomments", "comments"
end
