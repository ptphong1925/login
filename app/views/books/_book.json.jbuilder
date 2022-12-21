json.extract! book, :id, :title, :status, :catalogue, :year_published, :isbn, :price, :out_of_print, :views_count, :supplier_id, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)
