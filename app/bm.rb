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
    # @links_with_tag = Link.all(:tags => (Link.all.tags(:name => "#{params[:search_tag]}")))
    tag = Tag.first(name: params[:search_tag])
    @links_with_tag = tag ? tag.links : []
    erb(:tag_name)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tag].split(" ").each do |tag|
      link.tags << Tag.first_or_create(name: tag)
 #have to save after appending in a many to many relationship
    end

    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
