Feature: User

  As a usuario do sistema GerenciaDisciplinas
  I want to me cadastrar, logar e editar meu cadastro
  so that eu possa ter acesso as minhas informacoes no sistema

  Scenario: cadastro no sistema
    Given eu estou na pagina de login
    And eu clico para cadastrar um novo usuario
    When eu preencho os campos de nome 'Luis da Silva', e-mail 'luis@gmail.com', senha '123456' e confirmacao de senha '123456'
    And eu clico em cadastrar usuario
    Then eu vejo uma mensagem que o usuario foi cadastrado corretamente

  Scenario: logar no sistema
    Given eu estou na pagina de login
    And o usuario de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu preencho e-mail com "evandro@gmail.com" e senha com "123456"
    When eu clico em entrar
    Then eu vejo que estou logado com login "evandro@gmail.com"

  Scenario: cadastro com nome errado
    Given eu estou na pagina de login
    And eu clico para cadastrar um novo usuario
    When eu preencho os campos de nome 'Evandro4', e-mail 'evandro@gmail.com', senha '123456' e confirmacao de senha '123456'
    And eu clico em cadastrar usuario
    Then eu vejo a mensagem de erro "Somente letras são permitidas."