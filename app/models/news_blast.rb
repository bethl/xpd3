class NewsBlast < ActiveRecord::Base
  attr_accessible :date, :headline, :content
  
  serialize :content
end
