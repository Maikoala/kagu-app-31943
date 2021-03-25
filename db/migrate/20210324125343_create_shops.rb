class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name,      null: false
      t.text :info,        null: false
      t.references :owner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
