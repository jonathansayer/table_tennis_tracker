require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, unique: true, message: 'Name already registered'
  property :score, Integer, required: true, message: 'No Score Given'

end

