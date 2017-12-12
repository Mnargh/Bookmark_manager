require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource
  DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_BROWN_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

  property :id, Serial
  property :title, String
  property :url, String

  DataMapper.finalize
  DataMapper.auto_upgrade!
end
