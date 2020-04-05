class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string     :name,    null: false
      t.integer    :price,   null: false
      t.references :buyer,   null: false, foreign_key: { to_table: :users }
      t.references :seller,  null: false, foreign_key: { to_table: :users }
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
