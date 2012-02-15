class App < Framework
  def create_routes
    route '/upload', DataStore
  end
end