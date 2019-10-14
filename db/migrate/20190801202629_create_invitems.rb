class CreateInvitems < ActiveRecord::Migration[5.2]
  def change
    create_table :invitems do |t|
      t.string :invoice_numb
      t.string :part_code
      t.string :part_desc
      t.decimal :qty
      t.string :uom

      t.timestamps
    end
  end
end
