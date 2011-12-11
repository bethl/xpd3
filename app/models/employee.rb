class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :positiontitle, :origindate
  belongs_to :user
  
end
