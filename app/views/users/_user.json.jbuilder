json.extract! user, :id, :username, :password_digest, :first_name, :last_name, :phone, :token_user, :email, :balance, :nation, :birtday, :follows_count, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
