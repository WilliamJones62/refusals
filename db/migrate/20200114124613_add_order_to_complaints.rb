class AddOrderToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :order, :string
  end
end
