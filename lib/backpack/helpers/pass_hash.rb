require 'digest/sha1'

def pass_hash(password)
  password and Digest::SHA1.hexdigest password
end