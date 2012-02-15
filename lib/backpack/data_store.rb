require 'digest/md5'
require 'base64'

#Persists uploaded data to the database.
class DataStore
  def initialize(env)
     @env = env  
     req  = Rack::Request.new(@env)
     store(req.params['datafile'])
  end
  def store(file_attrs)  
    file  = file_attrs[:tempfile].read                  
    @hash  = get_hash(file)                                                     
    image = Image.create(:md5sum => @hash, :image => Base64.encode64(file))
  end               
  #64 digit hash. MD5 of the file prefixed to a 32 character random string
  def get_hash(file)
    Digest::MD5.hexdigest(file) + (0...32).map{ ('a'..'z').to_a[rand(26)] }.join
  end
  def get_response
    [200, {'Content-Type' => 'text/html'}, [@hash]]
  end
end