#Finds and serves the file with the supplied hash
class DataViewer
  def initialize(env) 
    @env = env
    hash = env['REQUEST_URI'].sub('/images/', '')
    retrieve(hash)
  end           
  def retrieve(hash)
    
  end
  def get_response   
    [200, {'Content-Type' => 'text/html'}, [@env.inspect]]
  end
end