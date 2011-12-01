class AlterUsers < ActiveRecord::Migration
  def up
    rename_table("users", "customers")
    change_column("customers", "email", :string, :limit => 100)
    rename_column("customers", "password", "hash_password")
    add_column("customers", "salt", :string, :limit => 40)
    add_index("customers", "email")
  end

  def down
    remove_index("customers", "email")
    remove_column("customers", "salt")
    rename_column("customers", "hash_password", "password")
    change_column("customers", "email", :string, :default => "", :null => false)
    rename_table("customers", "users")
  end
end
