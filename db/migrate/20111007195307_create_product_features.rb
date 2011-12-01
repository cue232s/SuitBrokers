class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.integer "product_id"
      t.string "name"
      t.boolean "active", :default => false
      t.timestamps
    end
  end
end
