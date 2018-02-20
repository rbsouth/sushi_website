require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'date'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

def current_user
	if session[:user_id]
		User.find(session[:user_id])
	end
end

def user_signed_in?
	!session[:user_id].nil?
end

get '/' do
  erb :sign_in, :layout => :layout_login
end

post '/sign-in' do
	email = params[:user][:email]
	password = params[:user][:password]
	@user = User.where(email: email).first
	if @user && @user.password == password
		session[:user_id] = @user.id
		redirect "/profile/#{@user.id}"
	else
		redirect "/"
	end
end

post '/new-user' do
	puts "------------PARAMS--------------"
	p params
	@user = User.create(params[:user])
	redirect "/profile/#{@user.id}"
end

post '/update-info' do
	puts "--------THE PARAMS---------"
	p params
	updates = {}
	params[:user].each do |col,val|
		if !val.blank?
		updates[col.to_sym] = val	
		end
	end
	@user = current_user
	@user.update_attributes(updates)
	redirect "/profile/#{@user.id}"
end

get '/destroy/:id' do
	@user = User.find(params[:id])
	@user.destroy
	redirect '/'
end
  
get '/home' do
	@posts = Post.order("created_at DESC").last(10)
	erb :home
end
  
get '/sign-up' do
	erb :sign_up, :layout => :layout_login
end

get '/profile/:id' do
	@user = User.find(params[:id])
	erb :profile
end

