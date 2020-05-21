class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
  end

  def show
    @category = Category.find(params[:id])
    @topics = @category.topics
    @topic = Topic.new
    @topic.responses.build
  end

  def destroy
  end
end
