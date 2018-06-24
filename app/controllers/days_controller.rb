class DaysController < ApplicationController

  get '/days' do
    binding.pry
    @day = Day.all
    erb :'/days/index'
  end

  post '/days' do
    @user = current_user
    @day = Day.create(params[:days])
    current_user.days << @day

    if @day.save

        redirect "/users/#{current_user.id}"
      else erb :'/days/new'
    end
  end

  get "/days/:id" do
    @user = User.find_by_id(params[:id])
    erb :'days/show'
  end

  get "/days/:id/edit" do
    @user = User.find_by_id(params[:id])
    erb :'days/edit'
  end


  # get '/days/new' do
  #   erb :'days/new'
  # end

  #
  # # GET: /days/5
  # get "/days/:id" do
  #   @day = Day.find(params[:id])
  #   erb :"/days/show.html"
  # end
  #
  # # GET: /days/5/edit
  # get "/days/:id/edit" do
  #   erb :"/days/edit.html"
  # end
  #
  # # PATCH: /days/5
  # patch "/days/:id" do
  #   redirect "/days/:id"
  # end
  #
  # # DELETE: /days/5/delete
  # delete "/days/:id/delete" do
  #   redirect "/days"
  # end
end
