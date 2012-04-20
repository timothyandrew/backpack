#Check if a request is authenticated
def authenticated?(req)
  if not req.params.include?('username')
    #File not linked to a user.
    return true
  else
    #File linked to a user
    user = User.get(req.params['username'])
    if not user
      #User doesn't exist
      @error_resp = [404, { 'Content-Type' => 'text/html' }, ["User does not exist"]]
      return false
    end
    if req.params['auth_token'] == user.auth_token
      if user.token_expires < DateTime.now
        @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Token expired! Re-login"]]
        user.token_expires = nil
        user.auth_token = nil
        user.save
        return false  
      end
      #Valid auth token. Authenticated
      return true
    end
  end
  #Not authenticated
  @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Authentication Failed"]]
  return false
end