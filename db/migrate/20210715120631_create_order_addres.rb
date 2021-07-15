class CreateOrderAddres < ActiveRecord::Migration[6.0]
  def change
    create_table :order_addres do |t|

      t.timestamps
    end
  end
end
