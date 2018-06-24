class UsersController < ApplicationController

  get '/signup' do
    # @user = User.new
    erb :'users/signup'
  end

  get '/login' do
   if !logged_in?
     erb :'login'
   else
     redirect to '/users/show'
   end
 end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/show"
    else
      erb :failure
    end
  end

  post '/users' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      erb :'users/signup'
  end
end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/new'
  end

  get "/users/:id/edit" do
    @user = User.find(params[:id])
    erb :'users/edit'
  end
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
