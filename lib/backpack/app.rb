class App < Framework
  def create_routes    
    #API Routes
    route '/api/upload', DataStore
    route '/api/file/*', DataRetrieve
    route  '/api/login', UserLogin
    route  '/api/upload', DataStore
    route  '/api/file/*', DataRetrieve
    route   '/api/login', UserLogin
    route '/api/files/*', UserDataListRetrieve
    
    #Other Routes
    route           '/', HomePage
    route     '/file/*', SingleFilePage
    route   '/static/*', ServeStatic
  end
end