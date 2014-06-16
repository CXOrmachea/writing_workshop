class ReadingsController < ApplicationController
  before_filter :check_user

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

  
  def check_user
    if current_user
      return true
    else
      flash[:notice] = "Please login"
      redirect_to new_user_session_path
    end
  end
end
