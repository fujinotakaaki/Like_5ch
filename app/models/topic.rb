class Topic < ApplicationRecord
  # キーワード検索メソッド
  scope :search_by, ->(keyword) do
    conditions = "title LIKE ? or body LIKE ?", "%#{keyword}%", "%#{keyword}%"
    joins(:responses).where(conditions).includes(:categories).order(updated_at: :desc).distinct
  end
  
  validates :title, presence: true
  validates_associated :responses

  has_many :responses
  has_many :categorizations
  has_many :categories, through: :categorizations, source: :category
  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :categorizations

  # タイトルとコメント数の表示書式
  def title_with_responses_count
    "#{title} (#{responses_count})"
  end

  def span
    "#{date_info created_at} 〜 #{date_info updated_at}"
  end

  def max_page
    responses_count / 100
  end

  def start_index(page)
    case page
    when -1 then
      responses_count > 50 ? responses_count - 49 : 1
    when -2 then
      1
    else
      1 + 100*page
    end
  end

  private

  # 日付情報を可読性の高い書式に変換
  def date_info( date_time )
    # （例）03月19日
    date_time.strftime('%m月%d日')
  end
end
