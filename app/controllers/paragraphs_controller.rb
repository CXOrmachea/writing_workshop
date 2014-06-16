class ParagraphsController < ApplicationController
  def index
  end

  def like
    @paragraph = Paragraph.find(params[:paragraph_id])
    @paragraph.liked_by current_user
    redirect_to @paragraph.story
  end

  def unlike
    @paragraph = Paragraph.find(params[:paragraph_id])
    @paragraph.unliked_by current_user
    redirect_to @paragraph.story
  end
end
