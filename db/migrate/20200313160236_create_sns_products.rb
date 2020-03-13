class CreateSnsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_products do |t|

      t.timestamps
    end
  end
end
