class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer "customer_id"
      t.string "address_type"
      t.string "street_address"
      t.string "street_address_2"
      t.string "city"
      t.string "state"
      t.integer "zip_code"
      t.timestamps
    end
      add_index("addresses", "customer_id")
  end
end
