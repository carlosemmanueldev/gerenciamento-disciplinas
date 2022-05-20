class Classroom < ApplicationRecord
  belongs_to :user
  has_many :students, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :lessons, through: :subjects

  validates :school_year, presence: true, length: { is: 1 }, numericality: { only_integer: true }
  validates :letter, presence: true, length: { is: 1 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :year, presence: true, length: { is: 4 }, numericality: { only_integer: true }

  before_save :uppercase_letter

  def name
    "#{school_year}º ano #{letter} - #{year}"
  end

  def uppercase_letter
    letter.upcase!
  end
end
