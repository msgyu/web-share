class AddColumToReceipt < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :status, :string
  end
end
