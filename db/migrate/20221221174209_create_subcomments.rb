class CreateSubcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :subcomments do |t|
      t.string :content
      t.string :status
      t.references :subcommenter, polymorphic: true, null: false
      t.references :comment, null: false, foreign_key: true
      t.integer :likes_count

      t.timestamps
    end
  end
end
