class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.references :friender, polymorphic: true, null: false
      t.boolean :accepted?
      t.references :friendable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
