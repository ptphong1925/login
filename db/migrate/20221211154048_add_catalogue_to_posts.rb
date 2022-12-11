class AddCatalogueToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :catalogue, :string
  end
end
