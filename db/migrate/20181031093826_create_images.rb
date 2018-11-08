class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :name
      t.integer :imageable_id
      t.string :imageable_type
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
