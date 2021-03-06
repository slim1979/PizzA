require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizza.db"

class Product < ActiveRecord::Base
end

configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Wrong login/password. Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end

before do
    @pizza=Product.all
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/pizza' do

erb :pizza_show
end

get '/login/form' do

		erb :login_form

end

post '/login/attempt' do

	@login = params[:username]
	@password = params[:user_password]

	if @login == 'admin' && @password == 'secret'
		session[:identity] = params[:username]
		erb :welcome
		#erb 'This is a secret place that only <%=session[:identity]%> has access to!'
	else
		@message = "Access denied"
		where_user_came_from = session[:previous_url] || '/'
		redirect to where_user_came_from
	end

end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  erb 'This is a secret place that only <%=session[:identity]%> has access to!'
end
