class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.text :info,           null: false
      t.integer :color_id,    null: false
      t.integer :price,       null: false
      t.references :owner,    null: false, foreign_key: true
      t.references :shop,     null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
