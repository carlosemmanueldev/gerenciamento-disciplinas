require "test_helper"

class StudentTest < ActiveSupport::TestCase

  test "Deve salvar um estudante cadastrado corretamente" do
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

    student = Student.new name: "Estudante Teste",
                          document: "12345678900",
                          classroom_id: classroom.id
    assert student.save
  end

  test "Não deve salvar um estudante sem nome" do
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

    student = Student.new name: nil,
                          document: "12345678900",
                          classroom_id: classroom.id
    assert_not student.save
  end
end
