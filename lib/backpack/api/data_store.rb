require 'digest/md5'
require 'base64'

#Persists uploaded data to the database.
class DataStore
  def initialize(env)
     @req  = Rack::Request.new(env)
     if not @req.post?
       @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Invalid @request!"]]       
       return
     end
     if authenticated?(@req)
       store(@req.params['file'])
     end
  end
  def store(file_attrs)     
    if not file_attrs
      @error_resp = [400, {'Content-Type' => 'text/html' }, ["No file sent"]]
      return
    end
    if not @req.params.include?('nobase64') 
      #Upload is through a form. Encode file to Base64
      file = Base64.encode64(file_attrs[:tempfile].read)
      mime_type = file_attrs[:head].sub(/.*Type:\s/m, '').chomp                                               
    else                                    
      #Upload is already in Base64. Simply strip out metadata at the beginning and store.
      file = file_attrs
      mime_type = file.match(/data:(.*);base64\,/).to_a.last
      file.gsub!(/.*\,/, '')
    end                 
    @hash     = get_hash(file)
    Filedatum.create(:md5sum => @hash, :data => file, :mime_type => mime_type, :user => User.get(@req.params['username']))
  end               
  #5 digit hash.
  def get_hash(file)
    (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
  end
  def get_response
    @error_resp || [200, {'Content-Type' => 'text/html' }, [@hash]]
  end
end