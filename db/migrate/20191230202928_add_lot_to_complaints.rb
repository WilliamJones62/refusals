class AddLotToComplaints < ActiveRecord::Migration[5.1]
  def change
    add_column :complaints, :lot, :string
  end
end
