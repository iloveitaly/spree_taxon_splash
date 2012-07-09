# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_taxon_splash'
  s.version     = '1.0.2'
  s.summary     = 'Create custom taxon splash pages'
  s.description = 'TODO: Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Michael Bianco'
  s.email             = 'info@cliffsidedev.com'
  s.homepage          = 'http://mabblog.com/'

  #s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.0'

  # test suite
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
