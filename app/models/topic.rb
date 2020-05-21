class Topic < ApplicationRecord
  validates :title, presence: true
  validates_associated :responses

  has_many :responses
  has_many :categorizations
  has_many :categories, through: :categorizations, source: :category
  accepts_nested_attributes_for :responses
  accepts_nested_attributes_for :categorizations

  def title_with_responses_count
    "#{title} (#{responses_count})"
  end
end
