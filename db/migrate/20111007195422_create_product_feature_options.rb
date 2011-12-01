class CreateProductFeatureOptions < ActiveRecord::Migration
  def change
    create_table :product_feature_options do |t|
      t.integer "product_feature_id"
      t.string "name"
      t.decimal "price", :precision => 8, :scale => 2
      t.boolean "active", :default => false
      t.timestamps
    end
  end
end
