class ResponsesController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    @response = topic.responses.build(create_params)
    if @response.valid?
      @response.token = current_user&.token || session[:token]
      @response.name = '名無しさん' if @response.name.blank?
      @response.save
      @idx = topic.reload.responses_count
    end
  end

  private

  def create_params
    params.require(:response).permit(:name, :body)
  end
end
