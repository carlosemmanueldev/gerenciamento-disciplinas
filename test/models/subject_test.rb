require "test_helper"

class SubjectTest < ActiveSupport::TestCase

  test "Deve salvar uma matéria cadastrada corretamente" do
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
  end

  test "Não deve salvar uma matéria sem ano" do
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
                          year: nil,
                          classroom_id: classroom.id
    assert_not subject.save
  end
end
