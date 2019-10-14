class AddTemperatureToReturnParts < ActiveRecord::Migration[5.1]
  def change
    add_column :return_parts, :temperature, :decimal
  end
end
