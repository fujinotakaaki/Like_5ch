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
    @response = Response.new(topic_id: params[:id])
    @responses = @topic.responses
  end

  def update
  end

  private

  def create_params
    raw_params = params.require(:topic).permit(
      :title,
      responses_attributes: %i(name body),
      categorizations_attributes: %i(category_id)
    )
    # 匿名者のIDの付与（セッションから取得）
    if raw_params[:responses_attributes][?0][:token].blank?
      raw_params[:responses_attributes][?0][:token] = session[:token] ||= SecureRandom.alphanumeric
    end
    # 名前の付与
    if raw_params[:responses_attributes][?0][:name].blank?
      raw_params[:responses_attributes][?0][:name] =  '名無しさん'
    end
    raw_params
  end

  def search_params
    begin
      params.require(:search).permit(:keyword)
    rescue
      nil
    end
  end
end
