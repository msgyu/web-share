class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,            null: false, index: true
      t.text :description,       null: false
      t.string :period           null: false
      t.integer :price,          null: false
      t.references :host,        foreign_key: { to_table: :users }
      t.references :client,      foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
