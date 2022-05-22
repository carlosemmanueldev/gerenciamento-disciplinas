Given('um usuario cadastrado de nome {string}, e-mail {string} e senha {string} existe') do |name, email, password|
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

Given('eu estou logado com e-mail {string} e senha {string}') do |email, password|
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
  click_on 'Entrar'
end

Given('a turma de letra {string}, ano {string} e ano letivo {string} existe') do |letter, school_year, year|
  visit '/classrooms/new'
  expect(page).to have_current_path('/classrooms/new')
  fill_in 'Série', with: school_year
  fill_in 'Letra', with: letter
  fill_in 'Ano', with: year
  click_on 'submit'
end

Given('eu estou na pagina de cadastro de disciplina') do
  visit '/subjects/new'
  expect(page).to have_current_path('/subjects/new')
end

Given('eu preencho o nome com {string}, ano letivo com {string} e seleciono a turma do {string}') do |name, year, classroom|
  fill_in 'Nome', with: name
  fill_in 'Ano', with: year
  select classroom, from: 'Turma'
end

When('eu clico em cadastrar disciplina') do
  click_on 'submit'
end

Then('vejo que a disciplina foi criada com sucesso') do
  expect(page).to have_content('A disciplina foi cadastrada com sucesso!')
end

Given('a disciplina de nome {string}, ano letivo {string} e turma do {string} existe') do |name, year, classroom|
  visit '/subjects/new'
  expect(page).to have_current_path('/subjects/new')
  fill_in 'Nome', with: name
  fill_in 'Ano', with: year
  select classroom, from: 'Turma'
  click_on 'submit'
end

Given('eu estou na pagina da disciplina de nome {string}, ano letivo {string}, turma {string} ano {string} de {string}') do |name, year, school_year, letter, year2|
  visit '/subjects'
  expect(page).to have_current_path('/subjects')
  expect(page).to have_content(name)
  click_on 'Ver disciplina'
  expect(page).to have_current_path('/subjects/1')
end

Given('Clico em editar disciplina') do
  click_on 'Editar disciplina'
end

When('Clico em atualizar a disciplina') do
  click_on 'submit'
end

Then('vejo que a disciplina foi alterada com sucesso') do
  expect(page).to have_content('A disciplina foi atualizada com sucesso!')
end

Then('eu vejo a mensagem de erro na disciplina {string}') do |error|
  expect(page).to have_content(error)
end
