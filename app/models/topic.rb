class Topic < ApplicationRecord
  validates :title, presence: true
  validates_associated :responses

  has_many :responses
  has_many :categorizations
  has_many :categories, through: :categorizations, source: :category
  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :categorizations

  # キーワード検索メソッド
  def self.search_by(keyword)
    conditions = "title LIKE ? or body LIKE ?", "%#{keyword}%", "%#{keyword}%"
    joins(:responses).where(conditions).includes(:categories).order(updated_at: :desc).distinct
  end

  # タイトルとコメント数の表示書式
  def title_with_responses_count
    "#{title} (#{responses_count})"
  end
end
