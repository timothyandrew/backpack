class HomePage
  def initialize(env)    
  end
  def get_response
    [200, { 'Content-Type' => 'text/html' }, ['<form action="http://0.0.0.0:9393/api/upload" enctype="multipart/form-data" method="post">
    <p>
    Please specify a file, or a set of files:<br>
    <input type="file" name="file" size="40">
    </p>
    <div>
    <input type="submit" value="Send">
    </div>
    </form>']]
  end
end