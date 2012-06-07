class MetadataStore
  def initialize(env) 
     @req  = Rack::Request.new(env)
     if not @req.post?
       @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Invalid @request!"]]       
       return
     end
     if authenticated?(@req)
      set_metadata(@req.params)
     end
  end           

  def set_metadata(params)
    puts params.inspect
    file = Filedatum.first(:md5sum => params['hash'])
    case params['type']
    when "likes"
      file.likes = file.likes + 1
      file.save
    when "comments"
      Comment.new(:filedatum => file, :text => params['comment_text']).save
    when "title"
      file.title = params['title']
      file.save
    end
  end
  def get_response   
    @error_resp || [200, { 'Content-Type' => 'text/html' }, ["Successful!"]]
  end
end