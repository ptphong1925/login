json.extract! admin, :id, :username, :password_digest, :first_name, :last_name, :phone, :token_user, :email, :balance, :nation, :birtday, :follows_count, :created_at, :updated_at
json.url admin_url(admin, format: :json)
