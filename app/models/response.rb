class Response < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :topic, counter_cache: true
end
