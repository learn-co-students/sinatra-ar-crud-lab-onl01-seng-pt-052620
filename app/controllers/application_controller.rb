
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    @articles = Article.all
    erb :"/articles/index.html"
  end
   
  #index
  get "/articles" do
    @articles = Article.all
    erb :"/articles/index.html"
  end
   
  #new
  get "/articles/new" do
    erb :"/articles/new.html"
  end

   #create
  post "/articles" do
    @article = Article.create(title: params[:article][:title], content: params[:article][:content])
    if @article.save
      redirect "/articles"
    else
      erb :"/articles/new.html"
    end
  end
  
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :"/articles/show.html"
  end
  
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :"/articles/edit.html"
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    if @article.update(title: params[:article][:title], content: params[:article][:content]).save
      redirect "/articles/#{@article.id}"
    else 
      erb :"/articles/edit.html"
    end
  end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end
   

end
