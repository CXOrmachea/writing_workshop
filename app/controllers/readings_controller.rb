class ReadingsController < ApplicationController
  def index
    @readings = Reading.all
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = current_user.readings.create(params[:reading])

    if @reading
      flash[:notice] = "Reading added."
      redirect_to readings_path
    else
      flash[:error] = "Reading didn't add for some reason. Please try again."
      render :new
    end
  end

  def edit
  end
end
