class AddLotToInvitems < ActiveRecord::Migration[5.1]
  def change
    add_column :invitems, :lot, :string
  end
end
