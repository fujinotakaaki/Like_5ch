class Categorization < ApplicationRecord
  belongs_to :topic
  belongs_to :category, counter_cache: true
end
