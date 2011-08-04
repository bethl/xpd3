class Person < ActiveRecord::Base  #rename this model to customer...
  belongs_to :user
  
  #has_many :addresses #
  
  attr_accessible :first_name, :last_name, :email
end
