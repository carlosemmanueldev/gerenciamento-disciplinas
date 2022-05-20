class Classroom < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :users
  has_many :subjects

  validates :school_year, presence: true
  validates :letter, presence: true, length: { is: 1 }, format: { with: /[A-Z]/ }
  validates :year, presence: true

  def name
    "#{school_year}º ano #{letter} - #{year}"
  end

end
