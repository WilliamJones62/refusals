class CreateOrdheads < ActiveRecord::Migration[5.1]
  def change
    create_table :ordheads do |t|
      t.string :order_numb
      t.string :rel_numb
      t.string :cust_code
      t.string :cust_name
      t.string :cust_po
      t.string :return_reason

      t.timestamps
    end
  end
end
