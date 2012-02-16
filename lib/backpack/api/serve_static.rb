require 'mime/types'

class ServeStatic
  def initialize(env)
    @path = Dir.pwd + env['REQUEST_URI']
  end
  def get_response
    begin
      file = File.new(@path, "r")
    rescue
      error_resp = [404, {'Content-Type' => 'text/html'}, ["Invalid URL. That file doesn't exist. Sorry!"]]
    end                           
    puts MIME::Types.type_for(file.path).first.to_s
    error_resp || [200, { 'Content-Type' => MIME::Types.type_for(file.path).first.to_s }, [file.read]]
  end
end