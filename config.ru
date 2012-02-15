require './lib/backpack.rb'  

DataMapper.setup(:default, 'mysql://root:root@localhost/backpack')
#DataMapper.auto_migrate!
DataMapper.auto_upgrade!

app = App.new
app.create_routes
run app 
