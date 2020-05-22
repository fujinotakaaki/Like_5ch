class TopicsController < ApplicationController
  def index
    @keyword = search_params[:keyword]
    # 検索ワードが存在しない場合はトップへ戻す
    redirect_to root_path if @keyword.blank?
    @topics = Topic.search_by(@keyword)
  end

  def create
    @topic = Topic.new(create_params)
    @topic.save
  end

  def show
    @topic = Topic.find(params[:id])
    @response = Response.new(topic_id: params[:id], name: current_user&.name)
    @responses = @topic.responses
  end

  def update
  end

  private

  def search_params
    params.require(:search).permit(:keyword)
  end

  def create_params
    raw_params = params.require(:topic).permit(
      :title,
      responses_attributes: %i(name body),
      categorizations_attributes: %i(category_id)
    )
    # 匿名者のIDの付与（セッションから取得）
    raw_params[:responses_attributes][?0][:token] = current_user&.token || session[:token]
    # 名前の付与
    if raw_params[:responses_attributes][?0][:name].blank?
      raw_params[:responses_attributes][?0][:name] =  '名無しさん'
    end
    raw_params
  end
end
