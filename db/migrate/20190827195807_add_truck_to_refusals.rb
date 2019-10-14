class AddTruckToRefusals < ActiveRecord::Migration[5.1]
  def change
    add_column :refusals, :truck, :string
  end
end
