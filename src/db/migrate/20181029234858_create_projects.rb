class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :product
      t.integer :price
      t.string :title
      t.text :overview
      t.text :description
      t.date :deadline
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
