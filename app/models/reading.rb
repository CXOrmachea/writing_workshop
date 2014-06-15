class Reading < ActiveRecord::Base
  belongs_to :user
  attr_accessible :link
end
