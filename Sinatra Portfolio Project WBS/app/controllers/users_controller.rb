class UsersController < ApplicationController

    get '/signup' do
      erb:'users/signup'
    end
  
    get '/login' do
      erb:'users/login'
    end
  
    post '/signup' do
      # this is the way you should do it if you're using nested params User.create(params[:user])
      # Does NOT check for DUPLICATE users. Will throw error
      user = User.new
      user.username = params[:username]
      user.password = params[:password]
      user.save
      session[:user_id] = user.id
      redirect to '/'
    end
  
    post '/login' do
      user = User.find_by(username: params[:username])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
      else
        @error = "Invalid Credentials"
        erb:'/login' 
      end
    end
  
    get '/logout' do
      session[:user_id] = nil
      redirect to "/"
    end

    post '/users' do 
      @user = User.new(params)
     if @user.save
       session[:user_id] = @user.id 
       redirect "/users/#{@user.id}"
     else 
      redirect '/signup'
      flash[:notice] = "invalid session id."
     end
    end 
 
    # SHOW 
    get '/users/:id' do 
     flash[:notice] = "your reviews."
    @user = User.find_by(id: params[:id])
    @posts = @user.posts 
    redirect_if_not_logged_in
    erb:'/users/show'
    end 
  
end