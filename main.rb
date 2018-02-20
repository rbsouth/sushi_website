require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'date'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

current_user = User.find(session[:user])

get '/' do
  erb :sign_in, :layout => :layout_login
end

post '/sign-in' do
	email = params[:user][:email]
	password = params[:user][:password]
	@user = User.where(email: email).first
	if @user && @user.password == password
		session[:user_id] = @user.id
		redirect "/yay"
		# redirect "/profile/#{@user.id}"
	else
		redirect "/"
	end
end

post '/new-user' do
	puts "------------PARAMS--------------"
	p params
	@user = User.create(params[:user])
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

post '/new-post' do
	current_user.posts.create(created_at: Time.now, content: params[:post][:content], picture: params[:post][:picture])
	#if picture field is empty, add .hide to picture div class 
	redirect :home
end