class CategorizationsController < ApplicationController
  def create
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @categorizations = @topic.categorizations.includes(:category)
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @categories = @topic.categories
  end

  def destroy
    # このアクションでのtopic_idはcategorizationのID
    categorization = Categorization.find(params[:topic_id])
    categorization.destroy
  end
end
