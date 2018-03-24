class DeleteAvgAgeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :sports, :average_age
  end
end
