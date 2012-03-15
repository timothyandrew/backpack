require 'digest/md5'
require 'base64'

#Persists uploaded data to the database.
class DataStore
  def initialize(env)
     req  = Rack::Request.new(env)
     if not req.post?
       @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Invalid request!"]]       
       return
     end
     store(req.params['file'])
  end
  def store(file_attrs)     
    file      = file_attrs[:tempfile].read                  
    mime_type = file_attrs[:head].sub(/.*Type:\s/m, '').chomp
    @hash     = get_hash(file)                                                 
    Filedatum.create(:md5sum => @hash, :data => Base64.encode64(file), :mime_type => mime_type)
  end               
  #64 digit hash. MD5 of the file prefixed to a 32 character random string
  def get_hash(file)
    Digest::MD5.hexdigest(file) + (0...32).map{ ('a'..'z').to_a[rand(26)] }.join
  end
  def get_response
    @error_resp || [200, {'Content-Type' => 'text/html' }, [@hash}]]
  end
end