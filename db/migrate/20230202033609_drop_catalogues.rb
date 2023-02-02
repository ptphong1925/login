class DropCatalogues < ActiveRecord::Migration[7.0]
  def change
    drop_table :catalogues
  end
end
