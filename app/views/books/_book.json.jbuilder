json.extract! book, :id, :title, :year_published, :isbn, :price, :out_of_print, :views, :supplier_id, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)
