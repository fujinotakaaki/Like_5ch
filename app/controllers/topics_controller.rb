class TopicsController < ApplicationController
  def index
    keyword = search_params[:keyword]
    @topics = begin
      unless keyword.blank?
        Topic.where("title LIKE ?", "%#{keyword}%")
      else
        Topic.all
      end
    end
  end

  def create
  end

  def show
    @topic = Topic.find(params[:id])
    @responses = @topic.responses
    @response = @topic.responses.new
  end

  def update
  end

  private

  def search_params
    params.require(:search).permit(:keyword)
  end
end
