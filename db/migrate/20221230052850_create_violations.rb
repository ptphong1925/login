class CreateViolations < ActiveRecord::Migration[7.0]
  def change
    create_table :violations do |t|
      t.string :name

      t.timestamps
    end
  end
end
