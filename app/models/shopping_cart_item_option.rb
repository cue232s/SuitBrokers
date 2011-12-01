class ShoppingCartItemOption < ActiveRecord::Base
  belongs_to  :shopping_cart_item

  has_one     :product
  has_one     :product_feature
  has_one     :product_feature_option

end
