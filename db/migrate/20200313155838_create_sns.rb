class CreateSns < ActiveRecord::Migration[5.2]
  def change
    create_table :sns do |t|
      t.references :user,  null: false, foreign_key: true
      t.string :kind,      null: false
      t.string :url,       null: false
      t.integer :follower
      t.timestamps
    end
  end
end
