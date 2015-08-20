source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# post_items
gem 'cocoon', '~> 1.2.6'
# utilizes markdown in both title and description
gem 'redcarpet', '~> 3.3.2'
# Image processing/compression
gem 'paperclip-compression', '~> 0.3.10'
# post captcha
gem 'recaptcha', '~> 0.4.0'
# For file/image saving, uncompatable beyond 2.0
gem 'aws-sdk', '< 2.0'
# I've finally given in.... (for compression of css)
gem 'sass', '~> 3.4.16'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  # interfaces imagemagick and app on heroku
  gem 'rmagick', '~> 2.15.3'
  gem 'rails_12factor'
  gem 'heroku_rails_deflate'
end
