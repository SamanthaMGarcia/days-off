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
          flash[:message] = "Please ensure all fields are filled before submitting."
          redirect to '/days/new'
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
    @day = Day.find_by_id(params[:id])
    if logged_in? && @day && current_user.id == @day.user.id
      @user = current_user
      erb :'/days/edit'
    else
      redirect to '/login'
    end
  end

  patch '/days/:id' do
    @day = Day.find_by_id(params[:id])
   if logged_in? && current_user.id == @day.user.id
       if @day && @day.user == current_user
         if @day.update(params[:days])
           redirect to "/days/#{@day.id}"
         else
            flash[:message] = "Please ensure all fields are filled before submitting."
           redirect to "/days/#{@day.id}/edit"
         end
       else
         flash[:message] = "You don't have permission to edit this day."
         redirect to '/days'
       end
    else
     redirect to '/login'
   end
  end

    delete "/days/:id/delete" do
      @day = Day.find_by_id(params[:id])
      if logged_in? && current_user.id == @day.user.id
        if @day && @day.user == current_user
          @day.delete
        end
        redirect to '/days'
      else
        redirect to '/login'
      end
    end
  end
