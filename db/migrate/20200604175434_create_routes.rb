class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.date :dueout_date
      t.string :order_numb
      t.string :cust_code
      t.string :shipto_code
      t.string :shipname
      t.string :route_code
      t.string :stop_no

      t.timestamps
    end
  end
end
