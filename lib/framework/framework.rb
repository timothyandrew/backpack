class Framework 
  def initialize
    @route_map = {}
    @routes = []
  end  
  def route(uri, class_name)
    @route_map[uri] = class_name
    @routes << uri
  end
  def call(env)
    return [200, { 'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['Error in url! 404']]
    path = env["PATH_INFO"]                      
    #Find a matching URI
    if(matching_route = @routes.find { |route| path.match(route + '/') or path == route })
      object = @route_map[matching_route].new env 
      object.get_response
    else
      [200, { 'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['Error in url! 404']]
    end
  end
end
