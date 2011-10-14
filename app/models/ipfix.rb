class Ipfix < ActiveRecord::Base
  attr_accessible :host, :ip
  
  validates :host, :uniqueness => true
end
