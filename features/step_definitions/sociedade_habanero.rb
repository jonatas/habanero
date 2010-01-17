Dado /^que eu visito a página inicial da sociedade habanero$/ do
  visit '/'
end

Quando /^eu digitar [oa] (.*) "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^pressionar o botão "([^\"]*)"$/ do |arg1|
  click_button(arg1)
end

Entao /^visualizarei o cadastro de pimentas$/ do
  response.should contain("pimentas")
end

Entao /^a pimenta "([^\"]*)" será adicionado a minha lista de pimentas$/ do |arg1|
  response.should include(arg1)
end
