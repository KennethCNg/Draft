class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :sport_name, null: false
      t.integer :average_age, null: false

      t.timestamps
    end
    add_index :sports, :sport_name, unique: true
  end
end
