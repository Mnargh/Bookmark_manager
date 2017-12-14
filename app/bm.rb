ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BM < Sinatra::Base

  get '/links/new' do
    erb(:add)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/tags/search_tag' do
    redirect "/tags/#{params[:tag_search]}"
  end

  get '/tags/:tag_search' do
    @links_with_tag = Link.all(:tags => params[:tag_search])
    p params[:tag_search]
    p Link.all
    p @links_with_tag

    erb(:tag_name)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    link.tags << Tag.create(name: params[:tag])
    link.save #have to save after appending in a many to many relationship
    redirect '/links'
  end

  run! if app_file == $0
end
