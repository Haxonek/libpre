# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# said put in environment.rb in initializers,
# but it only exists here so idk....
config.gem "jammit"
