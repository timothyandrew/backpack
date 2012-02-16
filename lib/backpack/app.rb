class App < Framework
  def create_routes
    route '/upload' , DataStore
    route '/file/*' , FileViewer
  end
end