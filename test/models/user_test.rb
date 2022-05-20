require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "Não deve salvar um usuário com nome que contém números " do
    user = User.new nome: "Luis 123",
                    email: "luis@gmail.com",
                    password: "123456",
                    password_confirmation: "123456"
    assert_not user.save
  end

  test "Não deve salvar um usuário com senha menor que 6 caracteres" do
    user = User.new nome: "Luis",
                    email: "luis@gmail.com",
                    password: "12345",
                    password_confirmation: "12345"
    assert_not user.save
  end
end
