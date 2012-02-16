#Finds and serves the file with the supplied hash
class DataRetrieve
  def initialize(env) 
    hash = env['REQUEST_URI'].sub('/api/file/', '')
    retrieve(hash)
  end           
  def retrieve(hash)
    file_data = Filedatum.first(:md5sum => hash)
    begin
      @file = Base64.decode64(file_data[:data])
      @mime_type = file_data[:mime_type]         
    rescue
      @error_resp = [404, { 'Content-Type' => 'text/html' }, ["No image matching that hash. Sorry!"]]
    end
  end
  def get_response   
    @error_resp || [200, { 'Content-Type' => @mime_type }, [@file]]
  end
end