module ApplicationHelper
  def header_include?
    %w(topics categories).include?( controller_name )
  end
end
