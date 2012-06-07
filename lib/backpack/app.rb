class App < Framework
  def create_routes    
    #API Routes
    route      '/api/upload', DataStore
    route      '/api/file/*', DataRetrieve
    route  '/api/metadata/*', MetadataRetrieve
    route  '/api/storemd'  , MetadataStore
    route       '/api/login', UserLogin
    route     '/api/files/*', UserDataListRetrieve

    route   '/static/*', ServeStatic
    
    #Other Routes
    route           '/', "HomePage"
    route     '/file/*', "SingleFilePage"
    route    '/files/*', "UserFileListPage"
  end
end