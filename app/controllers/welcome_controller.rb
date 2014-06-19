class WelcomeController < ApplicationController
  def index
    @stories = Story.all
    @readings = Reading.all
    @comment = Comment.new
  end
end
