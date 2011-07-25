class ListItem < ActiveRecord::Base
  attr_accessible :content
  belongs_to :Userz
end
