module TopicsHelper
  # 前ページのURL構築
  def before_topic_path( topic, **options )
    return topic_path(topic, page: topic.max_page) if options[:page].negative?
    options[:page] -= 1
    options[:page] = 0 if options[:page].negative?
    topic_path(topic, page: options[:page])
  end

  # 次ページのURL構築
  def next_topic_path( topic, **options )
    return topic_path(topic, page: topic.max_page) if options[:page].negative?
    options[:page] += 1
    options[:page] = topic.max_page if options[:page] > topic.max_page
    topic_path(topic, page: options[:page])
  end
end
