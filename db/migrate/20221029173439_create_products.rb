class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.integer :price
      t.text :description
      t.string :image
      t.integer :stock

      t.timestamps
    end
  end
end
