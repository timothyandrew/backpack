class MetadataRetrieve
  def initialize(env) 
    hash = env['REQUEST_URI'].sub('/api/metadata/', '')
    retrieve_metadata(hash)
  end           
  def retrieve_metadata(hash)
    file_data = Filedatum.first(:md5sum => hash)
    begin
      username = file_data.user.username if file_data.user
      likes = file_data.likes
      @metadata = {
        :title => file_data.title || hash,
        :belongs_to => username,
        :likes => likes,
        :comments => file_data.comments
      }
    rescue => e
      @error_resp = [404, { 'Content-Type' => 'text/html' }, ["No metadata matching the hash #{hash} Sorry!"]]
    end
  end
  def get_response   
    @error_resp || [200, { 'Content-Type' => 'text/html' }, [JSON.generate(@metadata)]]
  end
end