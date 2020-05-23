class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @categories = Category.save_names(create_params)
  end

  def show
    @category = Category.find(params[:id])
    @topics = @category.topics.order(updated_at: :desc)
    @topic = Topic.new
    @topic.responses.build(name: current_user&.name)
    @topic.categorizations.build(category_id: @category.id)
  end

  def destroy
    categories = Category.whrere(categorizations_count: 0)
    categories.dellete_all
  end

  private

  def create_params
    params.require(:category).permit(:names)
  end
end
