class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :option
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
