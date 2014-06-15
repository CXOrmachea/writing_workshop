class WelcomeController < ApplicationController
  def index
    @stories = Story.all
    @readings = Reading.all
  end
end
