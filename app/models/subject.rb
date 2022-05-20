class Subject < ApplicationRecord
  belongs_to :classroom
  has_many :students, through: :classroom
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: 'Somente letras e números são permitidas.' }
  validates :year, presence: true, length: { is: 4 }, numericality: { only_integer: true }
  validate :year_equal

  private

  def year_equal
    unless year.equal?(self.classroom.year)
      errors.add(:base, 'Ano letivo não corresponde ao da turma.')
    end
  end
end
