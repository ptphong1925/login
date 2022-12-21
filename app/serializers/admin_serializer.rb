class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :first_name, :last_name, :phone, :token_user, :email, :balance, :nation, :birtday, :follows_count
end
