class Story < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  has_many :paragraphs


  def paragraph_it
    text = self.body
    array = text.split("\r\n")
    array.each do |p|
      paragraph = Paragraph.new
      paragraph.body = p
      paragraph.story = self
      paragraph.save
    end
  end
end
