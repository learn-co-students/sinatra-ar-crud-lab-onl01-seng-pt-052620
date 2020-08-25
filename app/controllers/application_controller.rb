require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end

# get '/' do
# end

get '/articles' do
  @articles = Article.all
  erb :'index.html'
end

#create of CRUD
get '/articles/new' do
  erb :'new.html'
end

#create of CRUD
post '/articles' do
  article = Article.create(params)
  # erb :new
  redirect "/articles/#{article.id}" 
end

# # Read of CRUD
# get '/articles' do
#   @articles = Article.all
#   erb :'index.html'
# end

# READ of CRUD
get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :'show.html'
end

#UPDATE of crud
get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  erb :'edit.html'
end

#Update of CRUD
patch '/articles/:id' do
  @article = Article.find_by_id(params[:id])
  @article.update
  redirect "/articles/#{@article.id}"
end

#DELETE of CRUD
delete '/articles/:id' do
  @article = Article.find(params[:id])
  @article.destroy
  redirect "/articles"
end
end