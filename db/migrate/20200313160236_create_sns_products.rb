class CreateSnsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_products do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :product,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
