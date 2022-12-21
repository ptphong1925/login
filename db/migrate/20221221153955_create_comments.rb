class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :status
      t.references :commenter, polymorphic: true, null: false
      t.references :commentable, polymorphic: true, null: false
      t.integer :likes_count

      t.timestamps
    end
  end
end
