Feature: disciplina

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar, editar e visualizar disciplinas
  so that eu possa ter controle das disciplinas nas turmas que leciono

  Scenario: cadastrar disciplina
    Given um usuario cadastrado de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou logado com e-mail "evandro@gmail.com" e senha "123456"
    And a turma de letra "A", ano "8" e ano letivo "2020" existe
    Given eu estou na pagina de cadastro de disciplina
    And eu preencho o nome com "Ingles", ano letivo com "2020" e seleciono a turma "8" "A" de "2020"
    When eu clico em cadastrar disciplina
    Then vejo que a disciplina foi criada com sucesso

  Scenario: editar disciplina
    Given um usuario cadastrado de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou logado com e-mail "evandro@gmail.com" e senha "123456"
    And a turma de letra "A", ano "8" e ano letivo "2020" existe
    And a disciplina de nome "Ingles", ano letivo "2020" e turma do "8" ano "A" de "2020" existe
    And eu estou na pagina da disciplina de nome "Ingles", ano letivo "2020", turma "8" ano "A" de "2020"
    And Clico em editar disciplina
    And preencho nome com "Espanhol", ano letivo com "2020" e seleciono a turma "8" "A" de "2020"
    When Clico em atualizar a disciplina
    Then vejo que a disciplina foi alterada com sucesso

  Scenario: cadastrar disciplina com ano letivo menor que o permitido
    Given um usuario cadastrado de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou logado com e-mail "evandro@gmail.com" e senha "123456"
    And a turma de letra "A", ano "8" e ano letivo "2020" existe
    And eu estou na pagina de cadastro de disciplina
    And preencho nome com "Ingles", ano letivo com "1999" e seleciono a turma "8" "A" de "2020"
    When eu clico em cadastrar disciplina
    Then eu vejo a mensagem de erro na disciplina "Ano letivo não corresponde ao da turma."

