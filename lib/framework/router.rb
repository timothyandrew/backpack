module Router
  @route_map = {}
  @routes = []
  @params = {}

  class << self
    def route(uri, class_name)
      @route_map[uri] = class_name
      @routes << uri
    end
    def call(env)
      path = env["PATH_INFO"]                      
      req  = Rack::Request.new(env)
      #puts "Request recieved: #{Hash[req.params.map { |k,v| [k, v[0..25]]}]}"
      #Find a matching URI
      if (matching_route = @routes.find { |route| path.match(route + '/') or path == route }) && @route_map[matching_route].class == Class
        object = @route_map[matching_route].new env 
        response = object.get_response
        response[1]['Access-Control-Allow-Origin'] = '*' #Add header to circumvent cross domain restrictions
        #puts "Sending response body: #{response[2].inspect}"
        response
      elsif (matching_route = @routes.find { |route| path.match(route + '/') or path == route }) && @route_map[matching_route].class == String
        Views.render_view(@route_map[matching_route], env)
      else
        [404, { 'Content-Type' => 'text/html'}, ['Error in url! 404']]
      end
    end
  end
end
