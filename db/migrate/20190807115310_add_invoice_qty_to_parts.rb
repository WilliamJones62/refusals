class AddInvoiceQtyToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :invoice_qty, :decimal
  end
end
