class ChangeDatatypeOfAverageAgeFromIntegerToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :sports, :average_age, :float
  end
end
