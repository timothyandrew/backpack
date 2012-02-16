class App < Framework
  def create_routes
    route '/api/upload', DataStore
    route '/api/file/*', DataRetrieve
    route           '/', HomePage
    route     '/file/*', SingleFilePage
    route   '/static/*', ServeStatic
  end
end