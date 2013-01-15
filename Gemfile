source 'https://rubygems.org'

gemspec

gem 'rake'

# ignored with Travis
group :development do
  # docs
  gem 'yard'

  # file system notifications
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

  # auto testing
  gem 'guard-rspec'

  # growl notifications for tests
  gem 'ruby_gntp'

  # debugging
  gem 'pry'
end

# installed with Travis
group :test do
  gem 'rspec'
  gem 'simplecov'
end
