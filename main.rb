require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'date'

set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :sign_in
end
  
get '/home' do
	@posts = Post.order("created_at DESC").last(10)
	erb :home
end

get '/sign-in' do 
  erb :sign_in, :layout => :layout_login
end
  
get '/sign-up' do
	erb :sign_up, :layout => :layout_login
end

