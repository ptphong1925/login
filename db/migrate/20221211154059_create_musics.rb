class CreateMusics < ActiveRecord::Migration[7.0]
  def change
    create_table :musics do |t|
      t.string :title
      t.string :content
      t.string :catalogue
      t.references :poster, polymorphic: true, null: false

      t.timestamps
    end
  end
end
