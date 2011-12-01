require 'position_mover'

class ProductFeature < ActiveRecord::Base

  include PositionMover

     def position_scope
       "product_features.product_id = #{product_id.to_i}"
     end

  belongs_to  :product
  belongs_to  :shopping_cart_item_option
  has_many    :product_feature_options

  has_attached_file :photo,
    :styles => {
        :thumb => "100x100>",
        :small => "150x150>"}


  scope :sorted, order('product_features.position ASC')


 end
