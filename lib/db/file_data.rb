require 'data_mapper'

class FileData
  include DataMapper::Resource
  
  property :id,     Serial
  property :md5sum, String, :length => 64, :key => true
  property :data,  Binary, :length => 9999
  property :mime_type, String
end