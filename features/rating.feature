Feature: Avaliacao

  As a usuario do sistema GerenciaDisciplinas
  I want to cadastrar novas avaliacoes das atividades para os estudantes
  so that eu possa ter controle de atividades avaliativas e pontuacoes dos estudantes

  Scenario: criar avaliacao de uma atividade para um estudante
    Given existe um usuario de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456"
    And eu estou logado no sistema com e-mail "evandro@gmail.com" e senha "123456"
    And existe uma turma de letra "A", ano "5" e ano letivo "2020"
    And existe a disciplina de nome "Ingles", ano letivo "2020" e turma do "5º ano A - 2020"
    And a atividade de titulo "verbs", bimestre "1", descricao "em casa", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020" existe
    And o estudante de nome "Jorge Alves" e de CPF "12345678900" da turma do "5º ano A - 2020" existe
    Given eu estou na pagina de criacao de avaliacao
    And preencho nota com "3", descrição com "Errou muito", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono estudante de nome "Jorge Alves"
    When clico em cadastrar avaliacao
    Then vejo que a avaliacao foi criada com sucesso

  Scenario: criar avaliacao com descricao vazia
    Given existe um usuario de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456"
    And eu estou logado no sistema com e-mail "evandro@gmail.com" e senha "123456"
    And existe uma turma de letra "A", ano "5" e ano letivo "2020"
    And existe a disciplina de nome "Ingles", ano letivo "2020" e turma do "5º ano A - 2020"
    And a atividade de titulo "verbs", bimestre "1", descricao "em casa", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020" existe
    And o estudante de nome "Jorge Alves" e de CPF "12345678900" da turma do "5º ano A - 2020" existe
    Given eu estou na pagina de criacao de avaliacao
    And preencho nota com "3", descrição com "", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono estudante de nome "Jorge Alves"
    When clico em cadastrar avaliacao
    Then vejo que a avaliacao foi criada com sucesso

  Scenario: criar avaliacao fora do limite de pontos
    Given existe um usuario de nome "Evandro", e-mail "evandro@gmail.com" e senha "123456"
    And eu estou logado no sistema com e-mail "evandro@gmail.com" e senha "123456"
    And existe uma turma de letra "A", ano "5" e ano letivo "2020"
    And existe a disciplina de nome "Ingles", ano letivo "2020" e turma do "5º ano A - 2020"
    And a atividade de titulo "verbs", bimestre "1", descricao "em casa", data "04/05/2020" da disciplina de nome "Ingles" e ano letivo "2020" existe
    And o estudante de nome "Jorge Alves" e de CPF "12345678900" da turma do "5º ano A - 2020" existe
    Given eu estou na pagina de criacao de avaliacao
    And preencho nota com "11", descrição com "Errou muito", seleciono atividade de titulo "verbs" e bimestre "1" e seleciono estudante de nome "Jorge Alves"
    When clico em cadastrar avaliacao
    Then eu vejo uma mensagem informando o erro "A nota deve estar entre 0 e 10"