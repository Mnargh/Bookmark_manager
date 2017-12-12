require 'sinatra/base'
require_relative 'models/link'

class BM < Sinatra::Base


  get '/' do

  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  run! if app_file == $0
end
