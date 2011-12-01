class ProductFeatureOption < ActiveRecord::Base

    include  PositionMover

    def position_scope
      "product_feature_options.product_feature_id = #{product_feature_id.to_i}"
    end


    belongs_to  :product_feature
    belongs_to  :shopping_cart_item_option

    has_attached_file :photo,
      :styles => {
          :thumb => "100x100>",
          :small => "150x150>"}

    scope :sorted, order('product_feature_options.position ASC')


end
