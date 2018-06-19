class DaYsController < ApplicationController

  # GET: /days
  get "/days" do
    erb :"/days/index.html"
  end

  # GET: /days/new
  get "/days/new" do
    erb :"/days/new.html"
  end

  # POST: /days
  post "/days" do
    redirect "/days"
  end

  # GET: /days/5
  get "/days/:id" do
    erb :"/days/show.html"
  end

  # GET: /days/5/edit
  get "/days/:id/edit" do
    erb :"/days/edit.html"
  end

  # PATCH: /days/5
  patch "/days/:id" do
    redirect "/days/:id"
  end

  # DELETE: /days/5/delete
  delete "/days/:id/delete" do
    redirect "/days"
  end
end
