class AddDescriptionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :text
  end
end
