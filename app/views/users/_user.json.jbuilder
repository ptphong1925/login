json.extract! user, :id, :first_name, :last_name, :role, :token_user, :email, :visits, :orders_count, :lock_version, :created_at, :updated_at
json.url user_url(user, format: :json)
