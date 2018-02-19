require 'sinatra'
require 'sinatra/activerecord'
require './models'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :sign_in, :layout => :layout_login
end

post '/new-user' do
	puts "------------PARAMS--------------"
	p params
	@user = User.create(params[:user])
end
  
get '/home' do
	erb :home
end
  
get '/sign-up' do
	erb :sign_up, :layout => :layout_login
end
