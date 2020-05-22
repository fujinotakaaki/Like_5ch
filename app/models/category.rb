class Category < ApplicationRecord
  validates :name, presence: true

  has_many :categorizations
  has_many :topics, through: :categorizations, source: :topic

  # 名前と登録レス数の表示書式
  def name_with_categorizations_count
    "#{name} (#{categorizations_count})"
  end
end
