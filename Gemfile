source "http://rubygems.org"

gem "rails", "2.3.11"

gem "mysql"   if Gem.available? "mysql"
gem "sqlite3" if Gem.available? "sqlite3"
gem "pgsql"   if Gem.available? "pgsql"

gem "haml", ">= 3.0.16"
gem "awesome_print"

group :test, :development do
  gem "ruby-debug"
end

group :test do
  gem "rspec-rails", "~> 1.3.3"
  gem "rspec", "~> 1.3.1"
  gem "mocha", "0.9.8"
  gem "factory_girl", "1.2.3"
  
  gem "ZenTest" if Gem.available? "ZenTest"
  gem "autotest-fsevent" if Gem.available? "autotest-fsevent"
  
  gem "cucumber"
  gem "cucumber-rails", "0.3.2"
  gem "database_cleaner"
  gem "webrat"
end