class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 登録日時を可読性の高い書式で取得
  def created_info
    date_info created_at
  end

  # 最終更新日時を可読性の高い書式で取得
  def updated_info
    date_info updated_at
  end

  private

  # 日付情報を可読性の高い書式に変換
  def date_info( date_time )
    # （例）2020年03月19日 03:15
    date_time.strftime('%Y年%m月%d日 %H:%M')
  end
end
