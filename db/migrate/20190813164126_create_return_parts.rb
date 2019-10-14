class CreateReturnParts < ActiveRecord::Migration[5.1]
  def change
    create_table :return_parts do |t|
      t.integer :return_id
      t.string :part_code
      t.string :part_desc
      t.decimal :qty
      t.string :uom
      t.decimal :order_qty
      t.boolean :confirmed

      t.timestamps
    end
  end
end
