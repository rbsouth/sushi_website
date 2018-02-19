require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :sign_in
end
  
get '/home' do
	erb :home
end