require 'rubygems' 
require 'mongonero' 
require 'sinatra' 

VALID_MAIL = /.*@.*\.\w+/

enable :sessions

helpers do
  def pimenteiro
    first = Pimenteiro.first(:conditions => {:email => session[:email]})
    Pimenteiro.new(first)
  end
end

get "/" do
  erb :index
end

post "/associar" do
  email = params[:email] 
  puts "**** params ****"
  puts params.inspect
  puts "**** session ****"
  puts session.inspect
  puts "Pimenteiro: #{pimenteiro.inspect}" 
  if email =~ VALID_MAIL
    session[:email] = email
    if not pimenteiro.new_record?
      Pimenteiro.find_or_create_by_email email
    end
    redirect '/adicionar_pimentas'
  else
    "erro email não válido: '#{params[:email]}'" #+ params.inspect
  end
end


get '/adicionar_pimentas' do
  erb :adicionar_pimentas
end

get '/apagar_pimenta/:id' do
  pim = pimenteiro
  pim.pimentas.delete_if { |pimenta| pimenta.id == params[:id] } 
  pim.save
  redirect '/adicionar_pimentas'
end

post '/adicionar_pimenta' do
  pim = pimenteiro
  pim.pimentas << Pimenta.create( params)
  pim.save
  redirect '/adicionar_pimentas'
end

