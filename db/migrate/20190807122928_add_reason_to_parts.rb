class AddReasonToParts < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :reason, :string
  end
end
