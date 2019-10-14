class CreateReturns < ActiveRecord::Migration[5.1]
  def change
    create_table :returns do |t|
      t.string :order_numb
      t.integer :user_id

      t.timestamps
    end
  end
end
