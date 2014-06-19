class ReadingsController < ApplicationController
  before_filter :check_user

  def index
    @readings = Reading.all
    @comment = Comment.new
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = current_user.readings.create(params[:reading])

    if @reading
      flash[:notice] = "Reading added."
      redirect_to root_path
    else
      flash[:error] = "Reading didn't add for some reason. Please try again."
      render :new
    end
  end

  def edit
  end

  def comment
    @reading = Reading.find(params[:reading_id])
    @comment = @reading.comments.create(params[:comment])
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
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
