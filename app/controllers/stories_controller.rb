class StoriesController < ApplicationController
  
  before_filter :check_user

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @paragraphs = @story.paragraphs
    @comment = Comment.new
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(params[:story])

    if @story
      flash[:notice] = "Story saved."
      @story.paragraph_it
      redirect_to @story
    else
      flash[:error] = "Story didn't save for some reason. Please try again."
      render :new
    end 
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])

    @story.update_attributes(params[:story])

    if @story.save
      flash[:notice] = "Story updated."
    else
      flash[:error] = "Story didn't update for some reason. Please try again."
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
