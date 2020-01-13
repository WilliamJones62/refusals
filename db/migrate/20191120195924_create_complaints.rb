class CreateComplaints < ActiveRecord::Migration[5.1]
  def change
    create_table :complaints do |t|
      t.string :user
      t.string :invoice
      t.string :part
      t.integer :part_count
      t.string :issue
      t.date :issue_date

      t.timestamps
    end
  end
end
