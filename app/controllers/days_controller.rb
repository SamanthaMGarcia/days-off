class DaysController < ApplicationController

  get '/days' do
    @day = Day.all
    erb :'/days/index'
  end

  post '/days' do
    if logged_in?
      @user = current_user
      @day = Day.create(params[:days])
      @user.days << @day

      if @day.save

          redirect "/users/#{current_user.id}"
        else
          erb :'/days/new'
      end
    else
      redirect to '/login'
  end

  get "/days/new" do
    @user = current_user
    erb :'days/new'
  end

  get "/days/:id" do
    @day =  Day.find_by_id(params[:id])
    @user = current_user
    erb :'/days/show'
  end

  get "/days/:id/edit" do
    @user = current_user
    @day = Day.find_by_id(params[:id])
    erb :'/days/edit'
  end

  # patch "/days/:id" do
  #   if logged_in
  #   @day = Day.find(params[:id])
  #   unless Day.valid_params?(params)
  #     redirect to error message
  #   end
  #   @day.update
  #   redirect "/days/#{@day.id}"
  # end

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
