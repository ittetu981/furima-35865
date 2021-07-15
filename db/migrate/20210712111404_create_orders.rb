class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string      :postal_code             , null:false
      t.integer     :shipment_source_id      , null:false
      t.string      :municipality            , null:false
      t.string      :address                 , null:false
      t.string      :building_name
      t.string      :phone_number            , null:false
      t.references  :purchase                , null:false, foreign_key:true

      t.timestamps
    end
  end
end
