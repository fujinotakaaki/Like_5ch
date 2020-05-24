class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @categories = Category.save_names(create_params)
  end

  def show
    @category = Category.find(params[:id])
    @topics = @category.topics.order(updated_at: :desc).includes(:categories, :responses)
    @topic = Topic.new
    @topic.responses.build(name: current_user&.name)
    @topic.categorizations.build(category_id: @category.id)
  end

  def destroy
    Category.where(categorizations_count: 0).delete_all
    redirect_to categories_path
  end

  private

  def create_params
    params.require(:category).permit(:names)
  end
end
