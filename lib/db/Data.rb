require 'data_mapper'

class Data
  include DataMapper::Resource
  
  property :id,     Serial
  property :md5sum, String, :length => 64
  property :data,  Binary, :length => 999999999
end