source 'https://rubygems.org'

#Allows you to parse json within your Ruby code.
gem 'json'
#allow us to create a .env file to store environment variables outside of the bash profile
gem 'dotenv-rails', :groups => [:development, :test]
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
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

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#password and user functionaility
gem 'devise'
#allows maps to be added
gem 'geocoder'
#allows us to add images
gem 'paperclip'
#Allows pagination
gem 'will_paginate', '~> 3.0.6'
#allows inclusion of underscore.js which provides a variety of useful functions for use in application
gem 'underscore-rails'
#allows creation of a google map in conjunction with rails
gem 'gmaps4rails'
#allows simple data entry forms: hub.com/plataformatec/simple_form
gem 'simple_form'
#allow facebook login
gem 'omniauth-facebook'
#jquery ui - what does this do?
gem 'jquery-ui-rails'
#Allows you to produce charts and graphs on your apps.
gem "chartkick"
gem 'aws-sdk', '<2.0'

# for time validations in database tests
gem 'validates_timeliness', '~> 3.0'

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  #testing coverage
  gem 'coveralls', require: false
  gem 'shoulda'
  #allow testing of Javascript (Capybara's default web driver hiccups)
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'selenium-webdriver', '2.46.2'
  gem 'launchy'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # for testing photo uploading
  gem 'factory_girl_rails'
end
