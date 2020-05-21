class Category < ApplicationRecord
  validates :name, presence: true
  # validate :require_response_body

  has_many :categorizations
  has_many :topics, through: :categorizations, source: :topic

  def name_with_categorizations_count
    "#{name} (#{categorizations_count})"
  end

  private

  # def require_response_body
  #   if body.blank?
  #     errors.add(:body, "is not blank")
  #   end
  # end
end
