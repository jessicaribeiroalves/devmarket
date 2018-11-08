class AddProductIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :product, foreign_key: true
    remove_column :projects, :product, :string
  end
end
