class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :token_user
      t.string :email
      t.decimal :balance
      t.string :nation
      t.datetime :birtday
      t.integer :follows_count

      t.timestamps
    end
  end
end
