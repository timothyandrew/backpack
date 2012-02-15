libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'framework/framework'
require 'backpack/app'
require 'backpack/data_store'
require 'backpack/data_viewer'
require 'db/image'
