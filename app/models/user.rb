class User < ApplicationRecord
  has_many :classrooms, dependent: :destroy
  has_many :subjects, through: :classrooms
  has_many :students, through: :classrooms
  has_many :lessons, through: :subjects
  has_many :ratings, through: :lessons
  has_secure_password

  validates :name, presence: true, length: { minimum: 3 }, format: { with: /\A[a-zA-Z\s]+\z/, message: 'Somente letras são permitidas.' }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end