class Framework 
  attr_reader :routes

  def initialize
    @routes = {}
  end  
  def route(uri, class_name)
    @routes[uri] = class_name
  end
  def call(env)
    path = env["PATH_INFO"]
    begin
      object = @routes[path].new env 
      object.get_response
    rescue NoMethodError
      [404, { 'Content-Type' => 'text/html' }, ['Error in url!']]
    end
  end
end
