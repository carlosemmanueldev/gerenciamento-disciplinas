Given('existe um usuario de nome {string}, e-mail {string} e senha {string}') do |name, email, password|
  visit '/login'
  expect(page).to have_current_path('/login')
  click_on 'Cadastrar-se'
  expect(page).to have_current_path('/users/new')
  fill_in 'Nome',	with: name
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
  fill_in 'Confirme a senha', with: password
  click_on 'submit'
end

Given('eu estou logado no sistema com e-mail {string} e senha {string}') do |email, password|
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
  click_on 'Entrar'
end

Given('existe uma turma de letra {string}, ano {string} e ano letivo {string}') do |letter, school_year, year|
  visit '/classrooms/new'
  expect(page).to have_current_path('/classrooms/new')
  fill_in 'Série', with: school_year
  fill_in 'Letra', with: letter
  fill_in 'Ano', with: year
  click_on 'submit'
end

Given('existe a disciplina de nome {string}, ano letivo {string} e turma do {string}') do |name, year, classroom|
  visit '/subjects/new'
  expect(page).to have_current_path('/subjects/new')
  fill_in 'Nome', with: name
  fill_in 'Ano', with: year
  select classroom, from: 'Turma'
  click_on 'submit'
end

Given('a atividade de titulo {string}, bimestre {string}, descricao {string}, data {string} da disciplina de nome {string} e ano letivo {string} existe') do |title, bimester, description, date, subject, subject_year|
  visit '/lessons/new'
  expect(page).to have_current_path('/lessons/new')
  fill_in 'Título', with: title
  fill_in 'Descrição', with: description
  fill_in 'Bimestre', with: bimester
  fill_in 'Data de entrega', with: date
  select subject, from: 'Disciplina'
  click_on 'submit'
end

Given('o estudante de nome {string} e de CPF {string} da turma do {string} existe') do |name, document, classroom|
  visit '/students/new'
  expect(page).to have_current_path('/students/new')
  fill_in 'Nome', with: name
  fill_in 'CPF', with: document
  select classroom, from: 'Turma'
  click_on 'submit'
end

Given('eu estou na pagina de criacao de avaliacao') do
  visit '/ratings/new'
  expect(page).to have_current_path('/ratings/new')
end

Given('preencho nota com {string}, descrição com {string}, seleciono atividade de titulo {string} e bimestre {string} e seleciono estudante de nome {string}') do |grade, description, lesson, string4, student|
  fill_in 'Nota', with: grade
  fill_in 'Descrição', with: description
  select lesson, from: 'Atividade'
  select student, from: 'Estudante'
end

When('clico em cadastrar avaliacao') do
  click_on 'submit'
end

Then('vejo que a avaliacao foi criada com sucesso') do
  expect(page).to have_content('A avaliação foi cadastrada com sucesso!')
end

Then('eu vejo uma mensagem informando o erro {string}') do |error|
  expect(page).to have_content(error)
end