class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :liker, polymorphic: true, null: false
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
