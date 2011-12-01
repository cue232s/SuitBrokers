class CreateMeasurementProfiles < ActiveRecord::Migration
  def change
    create_table :measurement_profiles do |t|
      t.string "name"
      t.integer "height_feet"
      t.integer "height_inches"
      t.integer "jacket_length"
      t.integer "sleeves_length"
      t.integer "shoulders"
      t.integer "chest"
      t.integer "stomach"
      t.integer "hips"
      t.integer "pants_length"
      t.integer "inseam"
      t.integer "thigh"
      t.integer "waistcoat_length"
      t.integer "biceps"
      t.integer "wrist"
      t.integer "neck_perimeter"
      t.integer "shirt_length"
      t.integer "neck"
      t.integer "customer_id", :null => false
      t.timestamps
    end
      add_index("measurement_profiles", "customer_id")
  end
end


