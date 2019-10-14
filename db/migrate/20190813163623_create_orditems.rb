class CreateOrditems < ActiveRecord::Migration[5.1]
  def change
    create_table :orditems do |t|
      t.string :order_numb
      t.string :part_code
      t.string :part_desc
      t.decimal :qty
      t.string :uom

      t.timestamps
    end
  end
end
