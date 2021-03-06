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
    @categories = @topic.categories
    @response = Response.new(topic_id: @topic.id, name: current_user&.name)
    @page = params[:page].to_i
    @responses = @topic.responses.page(@page)
    @start_index = @topic.start_index(@page)
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
