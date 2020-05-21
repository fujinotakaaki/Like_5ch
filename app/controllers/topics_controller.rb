class TopicsController < ApplicationController
  def index
    keyword = search_params[:keyword]
    @topics = begin
      unless keyword.blank?
        Topic.where("title LIKE ?", "%#{keyword}%").includes(:categories).order(updated_at: :desc)
      else
        Topic.all.includes(:categories).order(updated_at: :desc)
      end
    end
  end

  def create
  end

  def show
    @topic = Topic.find(params[:id])
    @response = Response.new(topic_id: params[:id])
    @responses = @topic.responses
  end

  def update
  end

  private

  def search_params
    params.require(:search).permit(:keyword)
  end
end
