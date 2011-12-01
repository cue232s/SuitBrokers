class Customer < ActiveRecord::Base
  has_many  :addresses
  has_many  :measurement_profiles
  has_many  :shopping_carts

  scope :current_user, lambda {|id| where("id = ?", id)}

  validates_presence_of :first_name

  def name
    aName = first_name + ' ' + last_name
    return aName
  end
end
