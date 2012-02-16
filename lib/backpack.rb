libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'framework/framework'
require 'backpack/app'
require 'backpack/api/data_store'
require 'backpack/api/data_retrieve'

require 'db/dummy_data'
require 'db/file_datum'
require 'db/user'             

require 'backpack/pages/home_page'
require 'backpack/pages/single_file_page'

