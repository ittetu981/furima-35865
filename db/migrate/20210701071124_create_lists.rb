class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.text :image
      t.string :product_name
      t.integer :price
      t.integer :delivery_charge_id
      t.timestamps
    end
  end
end
