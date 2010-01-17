require 'rubygems' 
require 'sinatra' 
VALID_MAIL = /.*@.*\.\w+/


get "/" do
  erb :index
end

post "/associar" do
  if params[:email] =~ VALID_MAIL
    session[:email] = params[:email]
    @associados ||= {}
    @associados[params[:email]] ||= []
    erb :adicionar_pimentas
  else
    "erro email não válido: #{params[:email]}" 
  end
end

post '/adicionar_pimenta' do
  @associados[session[:associado]].push params
end


