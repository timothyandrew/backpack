libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'framework/framework'
require 'backpack/app'
require 'backpack/data_store'
require 'backpack/file_viewer'
require 'db/file_data'
