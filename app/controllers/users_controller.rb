class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/use_rs/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/use_rs/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/use_rs/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/use_rs/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
