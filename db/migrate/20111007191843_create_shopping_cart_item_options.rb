class CreateShoppingCartItemOptions < ActiveRecord::Migration
  def change
    create_table :shopping_cart_item_options do |t|
      t.integer "shopping_cart_id"
      t.integer "product_id"
      t.integer "product_feature_id"
      t.integer "product_feature_option_id"
      t.timestamps
    end
  end
end
