class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
     t.string "shopping_cart_status"
      t.string "shipping_company"
      t.string "tracking_number"
      t.datetime "purchased_on"
      t.datetime "shipped_on"
      t.integer "customer_id"

      t.timestamps
    end
      add_index("shopping_carts","customer_id")
  end
end


