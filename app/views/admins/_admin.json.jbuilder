json.extract! admin, :id, :username, :password_digest, :first_name, :last_name, :token_user, :email, :created_at, :updated_at
json.url admin_url(admin, format: :json)
