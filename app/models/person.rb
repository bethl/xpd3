class Person < ActiveRecord::Base
  belongs_to :user
  
  #has_many :addresses #
  
  attr_accessible :first_name, :last_name, :email
end
