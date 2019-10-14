class AddTruckToReturns < ActiveRecord::Migration[5.1]
  def change
    add_column :returns, :truck, :string
  end
end
