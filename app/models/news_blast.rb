class NewsBlast < ActiveRecord::Base
  attr_accessible :date, :headline, :content
  
  validates_presence_of :date, :headline, :content
  #serialize :content
end
