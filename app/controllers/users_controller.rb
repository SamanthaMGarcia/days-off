class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    @user = current_user
    erb :'/users/show'
  end

  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    @user = User.create(username: params[:user][:username], password: params[:user][:password])
    @user.save
    session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
  end

  get '/login' do
  # @user = User.find_by(username: params[:username])
   if !logged_in?
     erb :'/users/login'
   else
     redirect to "/users/#{current_user.id}"
   end
 end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      erb :failure
    end
  end

  get "/logout" do
     if logged_in?
       session.clear
       redirect "/login"
     else
      redirect '/'
    end
  end
end
