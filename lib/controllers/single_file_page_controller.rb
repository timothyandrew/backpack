class SingleFilePageController
  def initialize(env)
    hash = env['REQUEST_URI'].sub('/file/', '')
    @file_uri = "/api/file/#{hash}"
  end
end