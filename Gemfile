source 'http://rubygems.org'
gemspec

group :test do
  gem 'ffaker'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  
  if RUBY_PLATFORM.downcase.include? "darwin"
    gem 'rb-fsevent'
    gem 'growl'
  end
end

gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise', :branch => '1-2-stable'
gem 'spree', '~> 1.2.3'
