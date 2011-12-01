# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111125223432) do

  create_table "addresses", :force => true do |t|
    t.integer  "customer_id"
    t.string   "address_type"
    t.string   "street_address"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "first_name",    :limit => 25
    t.string   "last_name",     :limit => 50
    t.string   "email",         :limit => 100, :default => "", :null => false
    t.string   "hash_password", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",          :limit => 40
  end

  add_index "customers", ["email"], :name => "index_customers_on_email"

  create_table "measurement_profiles", :force => true do |t|
    t.string   "name"
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.integer  "jacket_length"
    t.integer  "sleeves_length"
    t.integer  "shoulders"
    t.integer  "chest"
    t.integer  "stomach"
    t.integer  "hips"
    t.integer  "pants_length"
    t.integer  "inseam"
    t.integer  "thigh"
    t.integer  "waistcoat_length"
    t.integer  "biceps"
    t.integer  "wrist"
    t.integer  "neck_perimeter"
    t.integer  "shirt_length"
    t.integer  "neck"
    t.integer  "customer_id",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measurement_profiles", ["customer_id"], :name => "index_measurement_profiles_on_customer_id"

  create_table "product_feature_options", :force => true do |t|
    t.integer  "product_feature_id"
    t.string   "name"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.boolean  "active",                                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "product_features", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.boolean  "active",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.boolean  "active",                                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.integer  "parent_id"
  end

  create_table "shopping_cart_item_options", :force => true do |t|
    t.integer  "shopping_cart_id"
    t.integer  "product_id"
    t.integer  "product_feature_id"
    t.integer  "product_feature_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_cart_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "shopping_cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_carts", :force => true do |t|
    t.string   "shopping_cart_status"
    t.string   "shipping_company"
    t.string   "tracking_number"
    t.datetime "purchased_on"
    t.datetime "shipped_on"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shopping_carts", ["customer_id"], :name => "index_shopping_carts_on_customer_id"

end
