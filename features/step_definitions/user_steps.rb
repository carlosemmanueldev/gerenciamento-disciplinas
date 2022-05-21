Given('eu estou na pagina de login') do
  visit '/login'
  expect(page).to have_current_path('/login')
end

Given('eu clico para cadastrar um novo usuario') do
  click_on 'Cadastrar-se'
  expect(page).to have_current_path('/users/new')
end

When('eu preencho os campos de nome {string}, e-mail {string}, senha {string} e confirmacao de senha {string}') do |name, email, password, password_confirmation|
  fill_in 'user_name',	with: name
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password_confirmation
end

When('eu clico em cadastrar usuario') do
  click_on 'submit'
end

Then('eu vejo uma mensagem que o usuario foi cadastrado corretamente') do
  expect(page).to have_content('O usuário foi cadastrado com sucesso.')
end

Given('o usuario de nome {string}, e-mail {string} e senha {string} existe') do |name, email, password|
  click_on 'Cadastrar-se'
  expect(page).to have_current_path('/users/new')
  fill_in 'Nome',	with: name
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
  fill_in 'Confirme a senha', with: password
  click_on 'submit'
end

Given('eu preencho e-mail com {string} e senha com {string}') do |email, password|
  fill_in 'E-mail', with: email
  fill_in 'Senha', with: password
end

When('eu clico em entrar') do
  click_on 'Entrar'
end

Then('eu vejo que estou logado com login {string}') do |email|
  expect(page).to have_content(email)
end

Then('eu vejo a mensagem de erro {string}') do |error|
  expect(page).to have_content(error)
end