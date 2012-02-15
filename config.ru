require './lib/backpack.rb'  
require 'data_mapper'
                                                                  
DataMapper::setup(:default, ENV['DATABASE_URL'] || "mysql://root:root@localhost/backpack")
#DataMapper.auto_migrate!
DataMapper.auto_upgrade!

app = App.new
app.create_routes
run app
