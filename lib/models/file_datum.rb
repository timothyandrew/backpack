require 'data_mapper'

class Filedatum
  include DataMapper::Resource
  
  property :id,     Serial
  property :title, String
  property :md5sum, String, :length => 64, :key => true
  property :data,  Binary, :length => 999999999
  property :mime_type, String
  
  belongs_to :user, :required => false
end                                 
