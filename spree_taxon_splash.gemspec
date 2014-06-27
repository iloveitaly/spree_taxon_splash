# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_taxon_splash'
  s.version     = '1.0.3'
  s.summary     = 'Create custom taxon splash pages'
  s.description = "Ability to create customized splash pages for taxon displays."
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Michael Bianco'
  s.email             = 'info@cliffsidedev.com'
  s.homepage          = 'http://mabblog.com/'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1'

  # test suite
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails', '2.12.0'
  s.add_development_dependency 'sqlite3'
end
