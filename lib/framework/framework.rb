class Framework 
  attr_reader :routes

  def initialize
    @routes = {}
  end  
  def route(uri, &function)
    @routes[uri] = function
  end
  def default_route(&function)
    @default_route = function
  end
  def call(env)
    path = env["PATH_INFO"]
    begin
      @routes[path].call env
    rescue NoMethodError
      begin
        @default_route.call env
      rescue NoMethodError
        [404, { 'Content-Type' => 'text/html' }, 'Error in url!']
      end
    end
  end
end
