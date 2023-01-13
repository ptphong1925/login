class AddUidToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :integer
  end
end
