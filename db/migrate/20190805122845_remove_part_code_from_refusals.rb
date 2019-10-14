class RemovePartCodeFromRefusals < ActiveRecord::Migration[5.1]
  def change
    remove_column :refusals, :part_code, :string
  end
end
