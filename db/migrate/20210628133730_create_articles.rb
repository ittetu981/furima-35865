class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer      :category_id              , null: false
      t.integer      :delivery_charge_id       , null: false
      t.integer      :product_status_id        , null: false
      t.integer      :shipment_source_id       , null: false
      t.integer      :shipping_time_id       , null: false
      t.timestamps
    end
  end
end
