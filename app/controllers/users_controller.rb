class UsersController < ApplicationController

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
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

  # post '/users' do
  #   @user = User.new(params[:user])
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect "/users/#{@user.id}"
  #   else
  #     erb :'users/signup'
  #   end
  # end
  #



  #
  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end
  #
  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
