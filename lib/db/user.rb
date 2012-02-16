require 'data_mapper'

class User
  include DataMapper::Resource
  
  property :id,       Serial
  property :name, String
  property :password, String             
  
  has n, :filedata
end