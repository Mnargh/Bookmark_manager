ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BM < Sinatra::Base
  enable :sessions
  set :session_secret, 'Arbitrary session name'


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

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
