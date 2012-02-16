class App < Framework
  def create_routes
    route '/api/upload', DataStore
    route     '/file/*', FileViewer
    route           '/', HomePage
  end
end