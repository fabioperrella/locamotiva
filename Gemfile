source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'settingslogic'

gem "devise"
gem "cancan"

gem 'fastercsv' # Only required on Ruby 1.8 and below
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.1"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem "letter_opener"
  gem 'ruby-debug19'
  gem 'thin'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fakeweb-matcher'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  # performance
  gem 'spork', '~> 0.9.0.rc'
  gem "guard-rspec"
  gem "guard-spork"
  gem "guard-livereload"
  gem 'turn', :require => false
  gem "libnotify"
end