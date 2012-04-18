source 'http://rubygems.org'

# standard rails stuff
gem 'rails', '3.2.1'
gem 'will_paginate'
gem 'pg'

# to support various themes
#
 gem 'themes_for_rails', git: 'git://github.com/lucasefe/themes_for_rails.git'
# gem 'themes_for_rails',  path:'/Users/nsingh/dev/personal/themes_for_rails'
#gem 'themes_for_rails',  git: 'git://github.com/neerajdotname/themes_for_rails.git'

# splitable needs this to send POST request
gem 'faraday'

# heroku cedar stack needs it
gem 'thin'

# to handle credit card payments
gem 'activemerchant'
gem 'money'

# for uploading images
gem 'carrierwave'

# for storing image properties like height, width,size etc. It adds those info for thumbnails too
gem 'carrierwave-meta'

# for having nested items. order has billing_address and shipping_address nested
gem 'nested_form', git: 'git://github.com/ryanb/nested_form.git'

# for creating thumbnails for images
gem 'mini_magick'

# to manage states of payment_status and shipping_status
gem 'state_machine'

# visit /admin_data to manage data using browser
gem 'admin_data', '= 1.1.16'

# mustache.js
#
# Mustache is used to generate new product-group-condition
gem 'mustache'

# for validating email
gem 'email_validator', git: "git://github.com/bigbinary/email_validator.git"

# for security
gem 'strong_parameters', git: 'git://github.com/rails/strong_parameters.git'

# to make settings more flexible. Without hashr the code would be like this
#  Settings.s3['bucket_name']
# with hashr it becomes
#  Settings.s3.bucket_name
#
#  I can't use open-struct because that does not list all the keys
gem 'hashr'

# This gem maintains all the country codes and subregions for some of the countries
gem 'carmen', git: 'git://github.com/jim/carmen.git'

# for uploading pictures to s3 using carrierwave
gem 'fog'

# for error notification
gem "airbrake"

# This gem vendors jquery fancybox for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use.
gem 'fancybox-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :development, :test do
  gem 'ruby-debug19', require: 'ruby-debug'
  gem 'minitest-rails', git: 'git://github.com/rawongithub/minitest-rails.git', branch: 'gemspec'

  #gem 'push2heroku', git: 'git://github.com/neerajdotname/push2heroku.git'
  gem 'push2heroku', git: 'git://github.com/neerajdotname/push2heroku.git', branch: 'lab'

end


group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'faker'

  gem 'minitest', '~> 2.10.1'
  gem "minitest-rails-shoulda", git: 'git://github.com/rawongithub/minitest-rails-shoulda.git'

  gem 'guard'
  gem 'guard-minitest'

  gem 'sqlite3'

  # Colorize MiniTest output and show failing tests instantly
  gem 'minitest-colorize', git: 'git://github.com/nohupbrasil/minitest-colorize'

  gem 'database_cleaner'
  gem 'rb-fsevent'
  gem 'factory_girl_rails'
  gem "launchy"
  gem "mocha", :require => false
end
