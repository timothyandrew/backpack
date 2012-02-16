require 'data_mapper'

class User
  include DataMapper::Resource
  
  property :id,     Serial
  property :name, String, :required => true
  property :password             
  
  has n, :file_data
end