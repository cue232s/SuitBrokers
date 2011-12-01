class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.integer "product_id"
      t.integer "shopping_cart_id"
      t.timestamps
    end
  end
end
