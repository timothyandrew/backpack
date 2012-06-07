require 'data_mapper'

class Comment
  include DataMapper::Resource
  
  property :id,     Serial
  property :text,   Text, :required => true

  belongs_to :filedatum
end                                 
