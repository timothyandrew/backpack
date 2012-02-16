require 'haml'
require 'tilt'

class HomePage
  def initialize(env)    
  end
  def get_response
    engine = Tilt.new('templates/home_page.haml')    
    [200, { 'Content-Type' => 'text/html' }, [engine.render]]
  end
end