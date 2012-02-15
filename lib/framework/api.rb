class API 
  attr_reader :routes

  def initialize
    @routes = {}
  end  
  def route(uri, &function)
    @routes[uri] = function
  end
  def call(env)
    path = env["PATH_INFO"]
    begin
      @routes[path].call env
    rescue NoMethodError
      [404, {'Content-Type' => 'text/html'}, ["<h1>Bad Route!</h1>"]]
    end
  end
end
