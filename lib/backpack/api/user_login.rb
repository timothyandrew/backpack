require 'securerandom'
require 'date'

#Authenticate a user and provide a session token
class UserLogin
  def initialize(env)
    req  = Rack::Request.new(env)
    if not req.post?
      @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Invalid request!"]]       
      return
    end    
    @user = User.get(req.params['username'])
    if not @user
      @user = User.create(:username => req.params['username'], :password => req.params['password'])
    end

    if user_already_logged_in? and req.params['logout']
      @user.auth_token = nil
      @user.token_expires = nil
      @user.save
      @error_resp = [200, { 'Content-Type' => 'text/html' }, ["Logged out!"]]       
      return
    end

    if not @user.password == req.params['password']
      @error_resp = [400, { 'Content-Type' => 'text/html' }, ["Wrong password!"]]       
      return
    end 
    if not user_already_logged_in?
      assign_auth_token
    end
  end
  def assign_auth_token
    @token = SecureRandom.uuid
    @user.auth_token    = @token
    @user.token_expires = DateTime.now + 7
    @user.save
  end
  def user_already_logged_in?
    #If a token exists and it expires in the future, the user is already logged-in
    if @user.auth_token and @user.token_expires > DateTime.now
      @token = @user.auth_token
      return true
    end
    return false
  end
  def get_response
    @error_resp || [200, {'Content-Type' => 'text/html'}, [@token.chomp]]
  end
end 