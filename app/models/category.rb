class Category < ApplicationRecord
  validates :name, presence: true

  has_many :categorizations
  has_many :topics, through: :categorizations, source: :topic
end
