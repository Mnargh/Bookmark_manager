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
    redirect "/tags/#{params[:search_tag]}"
  end

  get '/tags/:search_tag' do
    @links_with_tag = Link.all(:tags => (Link.all.tags(:name => "#{params[:search_tag]}")))
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
