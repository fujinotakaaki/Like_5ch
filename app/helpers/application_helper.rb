module ApplicationHelper
  # ヘッダーを表示するページの判定
  def header_include?
    %w(topics categories).include?( controller_name )
  end

  # サインアップページの入力フォームのエラー詳細表示
  def resource_partial_error_message(sym)
    return unless resource.errors.details.has_key? sym
    hash = resource.errors.details[sym].shift
    message = I18n.t("errors.messages.#{hash[:error]}", count: @minimum_password_length)
    content_tag :label, message, class: "red"
  end

  # ページタイトル構築
  def full_title(page_title = '')
    base_title = "Xちゃんねる"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
