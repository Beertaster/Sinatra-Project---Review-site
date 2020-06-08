require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    logged_in_user_id = session[:user_id]
    @user = User.find_by(id: logged_in_user_id)
    if logged_in?
        redirect to "/users/#{logged_in_user_id}"
    else
        erb :index
    end
  end

  helpers do

    def logged_in
      #by using the double bang operator (!!) a booloan (truthy) is returned instead of an integer
      !!session[:user_id]
    end

    def current_user
        #retrieves instance variable current_user, if 'NIL' the 'or equals' operator switches to the id in session
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized?(post)
      post.user == current_user
    end

    def if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end

  end


end