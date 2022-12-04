class AddTokenUserToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token_user, :string
  end
end
