source 'http://rubygems.org'

gem 'rails', '3.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'settingslogic'
gem 'ffi'

gem "devise"
gem "cancan"
gem "thin"
gem "state_machine"

gem 'fastercsv' # Only required on Ruby 1.8 and below
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">= 1.0.3"
end

gem 'jquery-rails'

group :development, :test do
  gem "pry"
  gem "pry-nav"
  gem "letter_opener"
  #gem 'thin'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fakeweb-matcher'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  # performance
  gem "guard-rspec"
  gem "guard-livereload"
  gem 'turn', :require => false
  gem "libnotify"
end
