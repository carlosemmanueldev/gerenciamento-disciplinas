class Lesson < ApplicationRecord
  belongs_to :subject
  has_many :students, through: :subject
  has_many :ratings

  validates :title, presence: true, length: { minimum: 5, maximum: 20, message: 'Tamanho do titulo de 5-20 caracteres' }, format: { with: /\A[a-zA-Z0-9\s]+\z/ }
  validates :description, length: { maximum: 1000 }
  validates :delivery_date, presence: true
  validates :bimester, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 4 }
end
