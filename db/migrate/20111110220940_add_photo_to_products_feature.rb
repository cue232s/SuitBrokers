class AddPhotoToProductsFeature < ActiveRecord::Migration
   def self.up
    add_column :product_features, :photo_file_name, :string # Original filename
    add_column :product_features, :photo_content_type, :string # Mime type
    add_column :product_features, :photo_file_size, :integer # File size in bytes
  end

  def self.down
    remove_column :product_features, :photo_file_name
    remove_column :product_features, :photo_content_type
    remove_column :product_features, :photo_file_size
  end
end
