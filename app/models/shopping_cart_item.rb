class ShoppingCartItem < ActiveRecord::Base
  belongs_to  :shopping_cart

  has_one :product
  has_many  :shopping_cart_item_options
end
