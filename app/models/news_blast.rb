class NewsBlast < ActiveRecord::Base
  attr_accessible :date, :headline
  
  has_many :nb_items
end
