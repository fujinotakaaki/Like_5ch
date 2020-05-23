class CategorizationsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    # 送信情報の名前の配列を取得
    submit_names = Category.get_names_array(create_params)
    # 送信情報からカテゴリレコードの取得or登録
    categories = submit_names.map do |name|
      Category.find_or_create_by(name: name)
    end
    # 未登録のカテゴリのみをフィルタリング（未登録は登録も並行する）
    @categorizations = categories.map do |category|
      raw_params = { topic_id: @topic.id, category_id: category.id }
      !Categorization.find_by(raw_params) && Categorization.create(raw_params)
    end
    # falseを除去
    @categorizations = @categorizations.select{ |object| !!object }
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @categorizations = @topic.categorizations.includes(:category)
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @categories = @topic.categories
  end

  def destroy
    # このアクションでのtopic_idはcategorizationのID
    categorization = Categorization.find(params[:topic_id])
    categorization.destroy
  end

  private

  def create_params
    params.require(:category).permit(:names)
  end
end
