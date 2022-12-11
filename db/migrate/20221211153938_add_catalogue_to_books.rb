class AddCatalogueToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :catalogue, :string
  end
end
