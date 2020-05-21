class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
  end

  def show
    @category = Category.find(params[:id])
    @topics = @category.topics.order(updated_at: :desc)
    @topic = Topic.new
    @topic.responses.build
    @topic.categorizations.build
  end

  def destroy
  end
end
