class Topic < ApplicationRecord
  default_scope { includes(:categories).order(updated_at: :desc) }

  validates :title, presence: true

  has_many :responses
  has_many :categorizations
  has_many :categories, through: :categorizations, source: :category
end
