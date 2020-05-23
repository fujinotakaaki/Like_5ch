class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :categorizations, dependent: :destroy
  has_many :topics, through: :categorizations, source: :topic

  # 名前と登録スレッド数との表示書式
  def name_with_categorizations_count
    "#{name} (#{categorizations_count})"
  end

  class << self
    # 複数レコードの登録
    def save_names(permit_params)
      names = get_names_array(permit_params)
      # 各名前を保存（登録済みは除去）
      names.map do |name|
        category = new(name: name)
        category.save ? category : nil
      end.compact
      # 返値は配列
    end

    # 名前情報を配列に変換
    def get_names_array(permit_params)
      # 名前情報を取得
      names_text = permit_params.to_h[:names]
      # 空白区切りで分割（重複は除く）
      names_text.split( /[[:blank:]]/ ).uniq
    end
  end
end
