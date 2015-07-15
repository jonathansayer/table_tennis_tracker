require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/table_tennis_#{env}")

require './app/models/users'

DataMapper.finalize

DataMapper.auto_upgrade!