class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :status
      t.string :catalogue
      t.integer :year_published
      t.integer :isbn
      t.decimal :price
      t.boolean :out_of_print
      t.integer :views_count
      t.references :supplier, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
