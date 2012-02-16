require 'haml'
require 'tilt'

class SingleFilePage
  def initialize(env)
    hash = env['REQUEST_URI'].sub('/file/', '')
    @file_uri = "/api/file/#{hash}"
  end
  def get_response                  
    engine = Tilt.new('templates/single_file_page.haml')    
    [200, { 'Content-Type' => 'text/html' }, [engine.render(self)]]
  end
end