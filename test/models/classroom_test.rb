require "test_helper"

class ClassroomTest < ActiveSupport::TestCase

  test "Deve salvar uma turma cadastrada corretamente" do
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
  end

  test "Não deve salvar uma turma sem ano" do
    user = User.new nome: "Usuario Teste",
                    email: "usuarioteste@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"
    assert user.save

    classroom = Classroom.new school_year: "8",
                              letter: "A",
                              year: nil,
                              user_id: user.id
    assert_not classroom.save
  end
end
