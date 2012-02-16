require 'haml'
require 'tilt'

class HomePage
  def initialize(env)
    @upload_link = "/api/upload"    
  end
  def get_response
    engine = Tilt.new('templates/home_page.haml')    
    [200, { 'Content-Type' => 'text/html' }, [engine.render(self)]]
  end
end