require 'haml'
require 'tilt'
require 'json'

class UserFileListPage
  def initialize(env)
  	@username = env['REQUEST_URI'].sub('/files/', '')
  	@file_hashes = JSON.parse(UserDataListRetrieve.new(nil, @username).get_response.last.pop)
  end
  def get_response
    engine = Tilt.new('templates/user_file_list_page.haml')    
    [200, { 'Content-Type' => 'text/html' }, [engine.render(self)]]
  end
end