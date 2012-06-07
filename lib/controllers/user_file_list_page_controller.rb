class UserFileListPageController
  def initialize(env)
    @username = env['REQUEST_URI'].sub('/files/', '')
    user = User.get(@username)
    if user
      @files = user.filedata
      @file_path = {}
      @files.find_all { |file| file.mime_type.split('/').first == 'video' || file.mime_type.split('/').first == 'audio' }.each do |file|
        #Write video to file
        file_data = DataRetrieve.new({ 'REQUEST_URI' => "/api/file/#{file.md5sum}" }).get_response.last
        @file_path[file.md5sum] = File.join("static", "tmp", "#{file.md5sum}.#{file.mime_type.split('/').last}")
        f = File.new(File.join(Dir.pwd, @file_path[file.md5sum]), 'w+')
          f.write(file_data.first)
        f.close
      end
    end
  end
end