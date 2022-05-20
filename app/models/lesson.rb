class Lesson < ApplicationRecord
  belongs_to :subject
  has_one :rating

  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :delivery_date, presence: true, date: { after: Proc.new { Time.now }, message: "A data deve ser posterior a hoje" }
  validates :bimester, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 4 }
end
