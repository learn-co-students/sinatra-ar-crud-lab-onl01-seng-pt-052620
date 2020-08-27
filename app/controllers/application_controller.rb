
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/create_articles/new' do
    erb :new
  end

  post '/articles' do
    Model.create(title: params[:title])
    erb :show
  end

end
