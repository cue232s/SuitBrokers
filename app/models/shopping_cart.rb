class ShoppingCart < ActiveRecord::Base
  belongs_to :customer
  has_many  :shopping_cart_items
  has_many  :shopping_cart_item_options, :through => :shopping_cart_items
end
