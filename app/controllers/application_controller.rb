
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do

    erb :new 

  end 

  post '/articles' do
    @article1 = Article.create(params)

    redirect "/articles/#{@article1.id}"

  end 

  get '/articles/:id' do 

    @article2 = Article.find(params[:id])

    erb :show
  end 

  
  get '/index' do

    erb :index
  end

  get '/show' do

    erb :show
  end 


  get '/articles' do 

   @articles = Article.all

    erb :index 

  end 

  get '/articles/:id/edit' do
    @article3 = Article.find(params[:id])


    erb :edit

  end

  patch '/articles/:id' do
    @article3 = Article.find(params[:id])
    @article3.update(title:params[:title], content:params[:content])

    redirect "/articles/#{@article3.id}"
    

  end

  delete '/articles/:id' do
    @article3 = Article.find(params[:id])
    @article3.destroy

  end 


  


  
  

end
