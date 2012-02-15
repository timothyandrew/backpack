#Persists uploaded data to the database.
class DataStore
  def initialize(env)
     @env = env
  end
  def get_response
    [200, {'Content-Type' => 'text/html'}, [env.inspect]]
  end
end