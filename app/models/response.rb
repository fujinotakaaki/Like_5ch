class Response < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates :body, presence: true

  belongs_to :topic, counter_cache: true
end
