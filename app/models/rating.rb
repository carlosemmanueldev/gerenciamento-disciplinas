class Rating < ApplicationRecord
  belongs_to :lesson
  belongs_to :student

  validates :grade, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10, message: 'A nota deve estar entre 0 e 10' }
  validates :description, length: { maximum: 1000 }
  validate :student_is_not_already_rated
  validate :student_is_in_lesson

  private
  def student_is_not_already_rated
    if Rating.where(lesson_id: lesson_id, student_id: student_id).exists?
      errors.add(:student, 'O aluno já foi avaliado nesta atividade')
    end
  end

  def student_is_in_lesson
    if !lesson.students.include?(student)
      errors.add(:student, 'O aluno não está na aula')
    end
  end
end
