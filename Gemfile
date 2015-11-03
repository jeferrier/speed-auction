source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-slick-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

group :development do
  # Use sqlite3 as the database for Active Record
  # Except when pushing to heroku
  gem 'sqlite3'
  # gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  # gem 'rails_layout'
  gem 'coffee-script-source', '1.8.0'
end

group :production do
  # Use PostGreSQL when deploying to heroku
  # (It's heroku's default system)
  gem 'pg'
  gem 'rails_12factor'
end

# These are needed for file uploads to heroku
# And then on to Amazon S3
gem 'paperclip'
gem 'aws-sdk', '< 2.0'

gem 'chronic'
gem 'figaro'
gem 'high_voltage'
gem 'validates_email_format_of', '~>1.6.2'
gem 'validates_as_phone_number'
gem 'ruby-bbcode'

#For Bootstrap
gem 'bootstrap-sass', '~> 3.3.5'