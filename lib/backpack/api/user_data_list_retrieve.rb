require 'json'

class UserDataListRetrieve
	def initialize(env, username=nil)
		username ||= env['REQUEST_URI'].sub('/api/files/', '')
		user = User.get(username)	
		if not user
			@error_resp = [404, { 'Content-Type' => 'text/html' }, ["User does not exist"]]
			return
		end

		@user_data_list = user.filedata.map do |file|
												file.md5sum
											end
	end
	def get_response
		@error_resp || [200, {"Content-Type" => "text/html"}, [JSON.generate(@user_data_list)]]
	end
end