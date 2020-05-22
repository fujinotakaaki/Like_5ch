module ApplicationHelper
  def header_include?
    %w(topics categories).include?( controller_name )
  end

  def resource_partial_error_message(sym)
    return unless resource.errors.details.has_key? sym
    hash = resource.errors.details[sym].shift
    message = I18n.t("errors.messages.#{hash[:error]}", count: @minimum_password_length)
    content_tag :label, message, class: "red"
  end
end
