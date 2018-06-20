class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup.html'
  end

  post '/users' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
    # redirect "/signup"
  end
end

  get '/users/:id' do
    @user = User.find(session[:user_id])
    erb :'users/show.html'
  end
  #
  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   @owner = Owner.find(params[:id])
  #   erb :"/users/edit.html"
  # end
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
