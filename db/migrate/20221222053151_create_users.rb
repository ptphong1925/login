class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :token_user
      t.string :email
      t.decimal :balance
      t.string :nation
      t.datetime :birtday
      t.integer :follows_count
      t.string :role

      t.timestamps
    end
  end
end
