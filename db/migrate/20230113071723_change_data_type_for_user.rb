class ChangeDataTypeForUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :uid, :string, :limit => 25
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
