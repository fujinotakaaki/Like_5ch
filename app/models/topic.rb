class Topic < ApplicationRecord
  validates :title, presence: true

  has_many :responses
  has_many :categorizations
  has_many :categories, through: :categorizations, source: :category
  accepts_nested_attributes_for :responses
end
