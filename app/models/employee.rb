class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :positiontitle, :dob, :origindate, :employeeid
  belongs_to :user
end
