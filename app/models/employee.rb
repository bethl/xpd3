class Employee < ActiveRecord::Base
  attr_accessible :name, :email, :position_title, :dob, :origi_ndate, :employeeid
  belongs_to :user
end
