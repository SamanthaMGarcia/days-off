class DaysController < ApplicationController

  get '/days' do
    if logged_in?
      @day = Day.all
      erb :'/days/index'
    else
      redirect to '/login'
    end
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
end

  get "/days/new" do
    if logged_in?
      @user = current_user
      erb :'days/new'
    else
      redirect to '/login'
    end
  end

  get "/days/:id" do
    if logged_in?
      @day =  Day.find_by_id(params[:id])
      @user = current_user
      erb :'/days/show'
    else
      redirect to '/login'
    end
  end

  get "/days/:id/edit" do
    if logged_in?
      @user = current_user
      @day = Day.find_by_id(params[:id])
      erb :'/days/edit'
    else
      redirect to '/login'
    end
  end
  #
  # patch "/days/:id" do
  #     if !logged_in?
  #       redirect to '/login'
  #     else
  #       @day = Day.find(params[:id])
  #     end
  #       @day.update
  #     redirect "/days/#{@day.id}"
  #   end

  patch '/days/:id' do
   if logged_in?
     if params[:days] == ""
       binding.pry
       redirect to "/days/#@day.id}/edit"
     else
       @day = Day.find_by_id(params[:id])
       if @day && @day.user == current_user
         if @day.update(days: params[:days])
           redirect to "/days/#{@day.id}"
         else
           redirect to "/days/#{@day.id}/edit"
         end
       else
         redirect to '/days'
       end
     end
   else
     redirect to '/login'
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
