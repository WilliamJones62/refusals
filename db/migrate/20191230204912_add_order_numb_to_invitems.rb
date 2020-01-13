class AddOrderNumbToInvitems < ActiveRecord::Migration[5.1]
  def change
    add_column :invitems, :order_numb, :string
  end
end
