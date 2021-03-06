class PostsController < ApplicationController

    #index
    get "/posts" do
      erb :"/posts/index.html"
    end
  
    #new
    get "/posts/new" do
      erb :"/posts/new.html"
      flash[:notice] = "New post created."
    end
  
    # create
    post "/posts" do
      redirect "/posts"
    end
  
    # show
    get "/posts/:id" do
      erb :"/posts/show.html"
    end

    #edit
    get '/posts/:id/edit' do
      if_not_logged_in
      set_post 
      if authorized?(@post)
        erb :'/posts/edit'
      else
        redirect "users/#{current_user.id}"
        flash[:notice] = "not authorized user to edit these posts"
      end
    end

    helpers do 
     
      def set_post 
        @post = Post.find(params[:id])
      end 
    end 
  
  end