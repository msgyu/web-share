class RenameHostidColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :host_id, :user_id
  end
end
