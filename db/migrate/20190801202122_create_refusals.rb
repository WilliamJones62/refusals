class CreateRefusals < ActiveRecord::Migration[5.2]
  def change
    create_table :refusals do |t|
      t.string :invoice_numb
      t.string :part_code
      t.decimal :qty

      t.timestamps
    end
  end
end
