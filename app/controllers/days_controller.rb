class DaysController < ApplicationController

  post '/days' do
    @user = current_user
    binding.pry
    @day = Day.create(params[:daysoff])
    current_user.day.build(params[:daysoff])
    # @day.user.build(user_id: current_user.id)
    if @day.save

      @day.user_id = user_id

        redirect "/users/#{current_user.id}"
      else erb :"/users"
    end
  end

  get '/days' do
    @day = Day.all
    erb :"/days/index"
  end

  # # GET: /days/new
  # get "/days/new" do
  #   erb :"/days/new.html"
  # end
  #
  # # POST: /days
  # post "/days" do
  #   redirect "days/#{@day.id}"
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
