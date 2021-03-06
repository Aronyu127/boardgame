source 'https://rubygems.org'

gem 'aasm'
# DB
gem 'pg'
gem 'activerecord-postgis-adapter'
gem 'redis'
gem 'redis-objects', require: 'redis/objects'

# view rendering
gem 'rails-i18n'
gem 'jbuilder', '~> 2.0'
gem 'slim'
gem 'simple_form'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.1.0'

# api
gem 'httparty'
gem 'mechanize'

gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'omniauth'
gem 'omniauth-facebook'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# ENV
gem 'settingslogic'

# file upload
gem 'carrierwave'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :development do
  # capistrano
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-passenger'

  gem 'pry'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'puma'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'awesome_print'
  gem 'guard'
  gem 'guard-annotate'
  gem 'guard-rubocop'
  gem 'guard-rspec'
end
