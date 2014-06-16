class Paragraph < ActiveRecord::Base
  belongs_to :story
  attr_accessible :body

  acts_as_votable
end
