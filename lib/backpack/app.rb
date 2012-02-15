class App < Framework
  def create_routes
    route '/upload' , DataStore
    route '/images/*', FileViewer
  end
end