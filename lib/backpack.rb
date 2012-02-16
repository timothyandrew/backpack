libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'data_mapper'
require 'framework/framework'
require 'backpack/app'
require 'backpack/data_store'
require 'backpack/file_viewer'

require 'db/dummy_data'
require 'db/file_datum'
require 'db/user'

