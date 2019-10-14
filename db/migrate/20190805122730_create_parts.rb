class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.integer :refusal_id
      t.string :part_code
      t.string :part_desc
      t.string :uom
      t.decimal :qty

      t.timestamps
    end
  end
end
