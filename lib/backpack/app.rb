class App < Framework
  def create_routes
    route '/api/upload' , DataStore
    route '/file/*' , FileViewer
  end
end