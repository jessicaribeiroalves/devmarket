class RemoveProjectImageFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :project_image, :text
  end
end
