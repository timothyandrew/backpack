require 'data_mapper'

class Image
  include DataMapper::Resource
  
  property :id,     Serial
  property :md5sum, String, :length => 64
  property :image,  Binary, :length => 999999999
end