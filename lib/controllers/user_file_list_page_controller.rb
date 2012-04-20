class UserFileListPageController
  def initialize(env)
    @username = env['REQUEST_URI'].sub('/files/', '')
    @file_hashes = JSON.parse(UserDataListRetrieve.new(nil, @username).get_response.last.pop)
  end
end