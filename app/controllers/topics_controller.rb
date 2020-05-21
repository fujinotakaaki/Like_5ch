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
    @topic = Topic.new(create_params)
    @topic.save
    redirect_to topic_path(@topic)
  end

  def show
    @topic = Topic.find(params[:id])
    @response = Response.new(topic_id: params[:id])
    @responses = @topic.responses
  end

  def update
  end

  private

  def create_params
    params.require(:topic).permit(:title, responses_attributes: %i(name body))
  end

  def search_params
    begin
    params.require(:search).permit(:keyword)
  rescue
    { keyword: "" }
  end
  end
end
