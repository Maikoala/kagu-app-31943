class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :first_name        , null: false
      t.string :last_name         , null: false
      t.string :postal_code       , null: false
      t.integer :state_province_id, null: false
      t.string :city              , null: false
      t.string :address_line_1    , null: false
      t.string :address_line_2    , null: false
      t.string :phone_number      , null: false
      t.references :order         , null: false, foreign_key: true
      t.timestamps
    end
  end
end
