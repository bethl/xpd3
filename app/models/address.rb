class Address < ActiveRecord::Base
  #belongs_to_and_has_many :persons     # we need has many since one household will have multiple people in it and they will likely link to the same addresses...???
  belongs_to :user
  
  attr_accessible :name, :state, :city, :zipcode, :address1, :address2
end
