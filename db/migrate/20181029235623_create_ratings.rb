class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.text :testimony
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
