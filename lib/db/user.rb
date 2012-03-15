require 'data_mapper'

class User
  include DataMapper::Resource
  
  property :username,      String, :key => true
  property :password,      String             
  property :auth_token,    String
  property :token_expires, DateTime
  
  has n, :filedata
end