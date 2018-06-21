class UsersController < ApplicationController

  get '/signup' do
    # @user = User.new
    erb :'users/signup'
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
    @user = User.find(session[:user_id])
    erb :'users/show'
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
