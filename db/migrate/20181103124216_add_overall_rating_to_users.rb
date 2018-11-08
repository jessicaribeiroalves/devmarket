class AddOverallRatingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :overall_rating, :float
  end
end
