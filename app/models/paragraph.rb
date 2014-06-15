class Paragraph < ActiveRecord::Base
  belongs_to :story
  attr_accessible :body
end
