class nb_item < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :news_blast
end
