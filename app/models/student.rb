class Student < ApplicationRecord
  belongs_to :classroom
  has_many :subjects, through: :classroom
  has_many :ratings

  validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z\s]+\z/, message: 'Somente letras são permitidas.' }
  validates :document, presence: true, uniqueness: true, format: { with: /\A[0-9]{11}+\z/, :message => "O CPF deve conter 11 números" }
end
