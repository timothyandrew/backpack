require './lib/backpack.rb'  

namespace :db do
  task :populate do
    DataMapper::setup(:default, ENV['DATABASE_URL'] || "mysql://root:root@localhost/backpack")
    DataMapper.auto_migrate!
    DummyData.new.populate
    puts "Database emptied and populated with dummy data."
  end  
  task :empty do
    DataMapper::setup(:default, ENV['DATABASE_URL'] || "mysql://root:root@localhost/backpack")
    DataMapper.auto_migrate!    
  end
end