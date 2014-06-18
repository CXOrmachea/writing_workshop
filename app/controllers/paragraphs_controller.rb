class ParagraphsController < ApplicationController
  def index
  end

  def show
    @paragraph = Paragraph.find(params[:paragraph_id])
    @comments = @paragraph.comments
    @comment = Comment.new
  end

  def like
    @paragraph = Paragraph.find(params[:paragraph_id])
    @paragraph.liked_by current_user

    respond_to do |format|
      format.html { redirect_to @paragraph.story }
      format.js
    end
  end

  def unlike
    @paragraph = Paragraph.find(params[:paragraph_id])
    @paragraph.unliked_by current_user

    respond_to do |format|
      format.html { redirect_to @paragraph.story }
      format.js
    end
  end

  def comment
    @paragraph = Paragraph.find(params[:paragraph_id])
    @comment = @paragraph.comments.create(params[:comment])
    @comment.user = current_user
    @comment.save

    if @comment
      flash[:notice] = "Comment created"
      redirect_to @paragraph.story
    else
      flash[:error] = "Comment didn't save for some reason. Please try again."
      redirect_to @paragraph.story
    end
  end

end
