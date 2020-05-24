class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 登録日時を可読性の高い書式で取得
  def created_info
    datetime_info created_at
  end

  # 最終更新日時を可読性の高い書式で取得
  def updated_info
    datetime_info updated_at
  end

  private

  # 日時情報を可読性の高い書式に変換
  def datetime_info( date_time )
    # （例）2020年03月19日 03:15:10
    date_time.strftime('%Y年%m月%d日 %H:%M:%S')
  end
end
