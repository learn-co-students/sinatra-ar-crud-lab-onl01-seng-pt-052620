
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/articles/new" do 
    erb :"/views/new" 
  end 

  get "/articles" do 
    @articles = Article.all
    erb :"/views/index"  
  end 

  post "/articles" do 
    article = Article.create(article_params) 
    redirect "/articles/#{article.id}"
  end 

  get "/articles/:id" do 
    @article = Article.find(params[:id])
    erb :"/views/show"
  end 

  get "/articles/:id/edit" do 
    @article = Article.find(params[:id])
    erb :"/views/edit"
  end 

  patch "/articles/:id" do 
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect "/articles/#{@article.id}" 
  end 

  delete "/articles/:id" do 
    @article = Article.find(params[:id])
    @article.destroy 
    redirect "/articles"    
  end 

end 