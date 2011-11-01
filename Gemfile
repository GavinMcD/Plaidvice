source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'          # http://twitter.github.com/bootstrap/
gem 'omniauth'
gem "cancan"
gem 'will_paginate'                    # for pagination

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development do
    gem 'webbynode'                     # Recommended hosting provider. 
end

group :development, :test do
  gem "selenium-webdriver", "~> 2.9.0"
  gem 'turn', :require => false         # Pretty printed test output
  gem 'rspec-rails'                     # Use rspec to do our integration tests.
  gem 'factory_girl_rails'              # Factory girls makes it easy to mock objects for our tests.
  gem 'capybara'                        # Capybara lets us drive our integration tests via headless browser.
  gem 'launchy'                         # Launchy let's us launch the current state of the app in the browser if we need to diagnose.
  gem 'database_cleaner'                # Necessary for undoing transactions in the database during our integration tests.
  gem 'sqlite3'                         
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
end