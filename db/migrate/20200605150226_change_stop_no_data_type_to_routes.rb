class ChangeStopNoDataTypeToRoutes < ActiveRecord::Migration[5.1]
  def change
    change_column :routes, :stop_no, :float
  end
end
