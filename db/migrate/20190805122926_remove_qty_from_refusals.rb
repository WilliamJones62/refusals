class RemoveQtyFromRefusals < ActiveRecord::Migration[5.1]
  def change
    remove_column :refusals, :qty, :decimal
  end
end
