class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categorizations, dependent: :destroy
  has_many :topics, through: :categorizations, source: :topic

  # 名前と登録レス数の表示書式
  def name_with_categorizations_count
    "#{name} (#{categorizations_count})"
  end

  # 複数レコードの登録
  def self.save_names(raw_params)
    # 名前情報を取得
    names_text = raw_params.to_h[:names]
    # 空白区切りで分割
    names = names_text.split /[[:blank:]]/
    # 各名前を保存（登録済みは除去）
    names.map do |name|
      category = Category.new(name: name)
      category.save ? category : nil
    end.compact
    # 返値は配列
  end
end
