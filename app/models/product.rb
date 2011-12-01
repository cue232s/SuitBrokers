require 'position_mover'
class Product < ActiveRecord::Base

  include PositionMover


  belongs_to :parent, :class_name => "Product", :foreign_key => "parent_id"
  has_many :children, :class_name => "Product", :foreign_key => "parent_id"
  belongs_to :shopping_cart_item
  belongs_to  :shopping_cart_item_option
  has_many  :product_features
  has_many  :product_feature_options, :through => :product_features

  has_attached_file :photo,
    :styles => {
        :thumb => "100x100>",
        :small => "150x150>"}

  scope :sorted, order('products.position ASC')
end
