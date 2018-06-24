require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

    get "/" do
      erb :'index'
    end

    post "/signup" do
      if params[:username] == "" || params[:password] == ""
        redirect '/failure'
      else
        User.create(username: params[:username], password: params[:password])
        redirect '/login'
      end
    end

    helpers do

      def current_user
        @user ||= User.find(session[:user_id])
      end
    end
    #

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
    #   @user = User.find_by(username: params[:username])
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



  end
