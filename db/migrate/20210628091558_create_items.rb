class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t| 
      t.string :product_name,                      null: false
      t.text :description_of_item,                 null: false
      t.integer :category_id,                      null: false
      t.integer :delivery_charge_id,               null: false
      t.integer :product_status_id,                null: false
      t.integer :shipment_source_id,               null: false
      t.integer :price,                            null: false
      t.references :user,                          null: false, foreign_key: true
      t.integer :shipping_time_id,               null: false

      t.timestamps
    end
  end
end
