class App < Framework
  def create_routes
    route '/upload' , DataStore
    route '/image/*', DataViewer
  end
end