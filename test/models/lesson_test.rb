require "test_helper"

class LessonTest < ActiveSupport::TestCase

  test "Deve salvar uma atividade cadastrada corretamente" do
    user = User.new nome: "Usuario Teste",
                    email: "usuarioteste@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"
    assert user.save

    classroom = Classroom.new school_year: "8",
                              letter: "A",
                              year: "2022",
                              user_id: user.id
    assert classroom.save

    subject = Subject.new name: "Matemática",
                          year: "2022",
                          classroom_id: classroom.id
    assert subject.save

    lesson = Lesson.new title: "Atividade 1",
                        description: "Atividade feita para a disciplina de Matemática",
                        delivery_date: "2022-06-06",
                        bimester: "2",
                        subject_id: subject.id
    assert lesson.save
  end

  test "Não deve salvar uma atividade sem informar o titulo" do
    user = User.new nome: "Usuario Teste",
                    email: "usuarioteste@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"
    assert user.save

    classroom = Classroom.new school_year: "8",
                              letter: "A",
                              year: "2022",
                              user_id: user.id
    assert classroom.save

    subject = Subject.new name: "Matemática",
                          year: "2022",
                          classroom_id: classroom.id
    assert subject.save

    lesson = Lesson.new title: nil,
                        description: "Atividade feita para a disciplina de Matemática",
                        delivery_date: "2022-06-06",
                        bimester: "2",
                        subject_id: subject.id
    assert_not lesson.save
  end
end
