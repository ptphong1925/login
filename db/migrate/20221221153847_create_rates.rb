class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.string :rate
      t.references :rater, polymorphic: true, null: false
      t.references :rateable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
