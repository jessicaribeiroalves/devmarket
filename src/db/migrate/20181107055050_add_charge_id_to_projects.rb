class AddChargeIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :charge_id, :string
  end
end
