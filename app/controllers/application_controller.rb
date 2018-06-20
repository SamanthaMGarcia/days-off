require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

    get "/signup" do
      erb :signup
    end

    # post "/signup" do
    #   if params[:work_email] == "" || params[:password] == ""
    #     redirect '/failure'
    #   else
    #     User.create(work_email: params[:work_email], password: params[:password])
    #     redirect '/login'
    #   end
    # end
    #
    # get '/account' do
    #   @user = User.find(session[:user_id])
    #   erb :account
    # end
    #
    #
    # get "/login" do
    #   erb :login
    # end
    #
    # post "/login" do
    #   @user = User.find_by(work_email: params[:work_email])
    #   if @user && @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #     redirect to "/account"
    #   else
    #     redirect to "/failure"
    #   end
    # end
    #
    # get "/failure" do
    #   erb :failure
    # end
    #
    # get "/logout" do
    #   session.clear
    #   redirect "/"
    # end
    #
    # helpers do
    #   def logged_in?
    #     !!session[:user_id]
    #   end
    #
    #   def current_user
    #     User.find(session[:user_id])
    #   end
    # end

  end
