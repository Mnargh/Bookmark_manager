require 'sinatra/base'
require_relative 'models/link'

class BM < Sinatra::Base

  get '/links/new' do
    erb(:add)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  run! if app_file == $0
end
