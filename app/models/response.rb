class Response < ApplicationRecord
  scope :page, -> (number) do
    case number
    when ->i{!i.negative?} then
      limit(100).offset(100*number)
    when -1 then
      last(50)
    end
  end

  validates :body, presence: true

  belongs_to :topic, counter_cache: true, touch: true
end
