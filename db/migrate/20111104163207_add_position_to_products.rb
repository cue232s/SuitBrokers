class AddPositionToProducts < ActiveRecord::Migration
  def up
    add_column :products, :position, :integer
    add_column :product_features, :position, :integer
    add_column :product_feature_options, :position, :integer
  end

  def down
    remove_column :products, :position
    remove_column :product_features, :position
    remove_column :product_feature_options, :position
  end
end
