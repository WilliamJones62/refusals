class AddUserIdToOrderTemps < ActiveRecord::Migration[5.1]
  def change
    add_column :order_temps, :user_id, :integer
  end
end
