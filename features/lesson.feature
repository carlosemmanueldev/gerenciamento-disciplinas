Feature: Atividade

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar novas atividades das disciplinas
  so that eu possa ter controle de atividades dentro da disciplina

  Scenario: criar atividade de uma disciplina
    Given um usuario ja cadastrado no sistema de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou no sistema com o e-mail "evandro@gmail.com" e senha "123456"
    And uma turma de letra "A", ano "5" e ano letivo "2020" existe
    And uma disciplina de nome "Ingles", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given eu estou na pagina de cadastro de atividade
    And preencho titulo com "Modal Verbs", descricao "amanhã", bimestre "1", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020"
    When clico em cadastrar a atividade
    Then vejo que a atividade foi criada com sucesso

  Scenario: criar atividade com titulo menor que 5
    Given um usuario ja cadastrado no sistema de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou no sistema com o e-mail "evandro@gmail.com" e senha "123456"
    And uma turma de letra "A", ano "5" e ano letivo "2020" existe
    And uma disciplina de nome "Ingles", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given eu estou na pagina de cadastro de atividade
    And preencho titulo com "Mdo", descricao "amanhã", bimestre "1", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020"
    When clico em cadastrar a atividade
    Then eu vejo uma mensagem de erro "Tamanho do titulo de 5-20 caracteres"

  Scenario: criar atividade com descricao vazia
    Given um usuario ja cadastrado no sistema de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456" existe
    And eu estou no sistema com o e-mail "evandro@gmail.com" e senha "123456"
    And uma turma de letra "A", ano "5" e ano letivo "2020" existe
    And uma disciplina de nome "Ingles", ano letivo "2020" e turma do "5" ano "A" de "2020" existe
    Given eu estou na pagina de cadastro de atividade
    And preencho titulo com "Modal Verbs", descricao "amanhã", bimestre "1", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020"
    When clico em cadastrar a atividade
    Then vejo que a atividade foi criada com sucesso