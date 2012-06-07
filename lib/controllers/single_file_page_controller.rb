class SingleFilePageController
  def initialize(env)
    hash = env['REQUEST_URI'].sub('/file/', '')
    @file_uri = "/api/file/#{hash}"
    @mime_type = Filedatum.first(:md5sum => hash).mime_type

    if @mime_type.split('/').first == 'video' || @mime_type.split('/').first == 'audio'
      #Write video to file
      file_data = DataRetrieve.new({ 'REQUEST_URI' => "/api/file/#{hash}" }).get_response.last
      @file_path = File.join("static", "tmp", "#{hash}.#{@mime_type.split('/').last}")
      f = File.new(File.join(Dir.pwd, @file_path), 'w+')
        f.write(file_data.first)
      f.close
    end
  end
end