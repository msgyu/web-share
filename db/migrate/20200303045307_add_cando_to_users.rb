class AddCandoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cando, :text
    add_column :users, :title, :string
  end
end
