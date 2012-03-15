#Check if a request is authenticated
def authenticated?(req)
  if req.params['username'].empty?
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
      #Valid auth token. Authenticated
      return true
    end
  end
  #Not authenticated
  @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Authentication Failed"]]
  return false
end