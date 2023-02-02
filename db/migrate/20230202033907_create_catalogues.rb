class CreateCatalogues < ActiveRecord::Migration[7.0]
  def change
    create_table :catalogues do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
