Given('um usuario ja cadastrado no sistema de nome {string}, e-mail {string} e senha {string} existe') do |name, email, password|
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

Given('eu estou no sistema com o e-mail {string} e senha {string}') do |email, password|
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
  click_on 'Entrar'
end

Given('uma turma de letra {string}, ano {string} e ano letivo {string} existe') do |letter, school_year, year|
  visit '/classrooms/new'
  expect(page).to have_current_path('/classrooms/new')
  fill_in 'Série', with: school_year
  fill_in 'Letra', with: letter
  fill_in 'Ano', with: year
  click_on 'submit'
end

Given('uma disciplina de nome {string}, ano letivo {string} e turma do {string} ano {string} de {string} existe') do |name, year, classroom, string4, string5|
  visit '/subjects/new'
  expect(page).to have_current_path('/subjects/new')
  fill_in 'Nome', with: name
  fill_in 'Ano', with: year
  select classroom, from: 'Turma'
  click_on 'submit'
end

Given('eu estou na pagina de cadastro de atividade') do
  visit '/lessons/new'
  expect(page).to have_current_path('/lessons/new')
end

Given('preencho titulo com {string}, descricao {string}, bimestre {string}, data {string} da disciplina de nome {string} e ano letivo {string}') do |title, description, bimester, date, subject, subject_year|
  fill_in 'Título', with: title
  fill_in 'Descrição', with: description
  fill_in 'Bimestre', with: bimester
  fill_in 'Data de entrega', with: date
  select subject, from: 'Disciplina'
end

When('clico em cadastrar a atividade') do
  click_on 'submit'
end

Then('vejo que a atividade foi criada com sucesso') do
  expect(page).to have_content('A atividade foi criada com sucesso!')
end

Then('eu vejo uma mensagem de erro {string}') do |error|
  expect(page).to have_content(error)
end