class CreateOrderTemps < ActiveRecord::Migration[5.1]
  def change
    create_table :order_temps do |t|
      t.string :order_numb
      t.decimal :temperature

      t.timestamps
    end
  end
end
