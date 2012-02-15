class App < Framework
  def create_routes
    route '/imagea' do
      [200, {'Content-Type' => 'text/html'}, ["Hello Gajendra"]]
    end   
    default_route do
      [200, {'Content-Type' => 'text/html'}, ["Hello Timothy"]]
    end
  end
end