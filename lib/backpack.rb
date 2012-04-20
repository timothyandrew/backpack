libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'framework/router'
require 'framework/views'
require 'framework/framework'

require 'backpack/app'

# API Endpoints
require 'backpack/api/data_store'
require 'backpack/api/data_retrieve'
require 'backpack/api/serve_static'
require 'backpack/api/user_login'
require 'backpack/api/user_data_list_retrieve'

# Models
require 'models/dummy_data'
require 'models/file_datum'
require 'models/user'

# Controllers
require 'controllers/home_page_controller'
require 'controllers/single_file_page_controller'
require 'controllers/user_file_list_page_controller'

# Helpers
require 'backpack/helpers/auth'
require 'backpack/helpers/string_ext'