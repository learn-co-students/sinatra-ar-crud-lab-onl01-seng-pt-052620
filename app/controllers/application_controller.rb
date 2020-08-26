require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/show' do 
    erb :show 
  end
  
  get '/index' do 
    erb :index
  end
  
  get '/articles.new' do 
    erb :new
  end
  
  post '/articles' do 
    @article = Article(params)
    
    erb :show
  end
  
  get '/articles' do 
    @articles = Article.all
    
    erb :index
  end
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    
    erb :edit
  end
  
  patch '/articles/:id' do
    new_params = {}
    old_article = Article.find(params[:id])
    
    new_params[:name] = params[:name]
    new_params[:content] = params[:content]
    old_article.update(new_params)
  end
  
  delete '/articles/:id' do 
    article = Article.find(params[:id])
    
    article.destroy
    
    redirect '/index'
  end
end
