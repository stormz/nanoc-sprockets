# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'nanoc-sprockets'

Sprockets::Helpers.configure do |c|
  c.digest = true
end
