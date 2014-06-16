class Paragraph < ActiveRecord::Base
  belongs_to :story
  attr_accessible :body

  acts_as_votable
  acts_as_commentable
end
