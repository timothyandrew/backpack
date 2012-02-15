require './lib/backpack.rb'  

DataMapper.setup(:default, 'mysql://root:root@localhost/backpack')
DataMapper.auto_migrate!

app = App.new
app.create_routes
run app 
