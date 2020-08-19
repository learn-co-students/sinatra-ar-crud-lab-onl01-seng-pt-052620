
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do 
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
  end

  get "/articles" do
  
    @articles = Article.all

    erb :index

  end


  get "/articles/new" do

    erb :new

  end

  post "/articles" do
    
    @article = Article.create(params[:article])
   
    redirect "/articles/#{@article.id}"

  end


  get "/articles/:id" do

    @article = Article.find_by(id: params[:id])

    erb :show

  end

  get "/articles/:id/edit" do
  
    @article = Article.find_by(id: params[:id])

    erb :edit

  end

  patch "/articles/:id" do
    
    @article = Article.find_by(id: params[:id])
    if @article.update(title: params[:article][:title], content: params[:article][:content])
      redirect "/articles/#{@article.id}"
    else
      render :edit
    end

  end

  delete "/articles/:id" do

    @article = Article.find_by(id: params[:id])

    @article.delete

    redirect "./index"

  end

end

