class Reading < ActiveRecord::Base
  belongs_to :user
  attr_accessible :link

  acts_as_commentable
end
