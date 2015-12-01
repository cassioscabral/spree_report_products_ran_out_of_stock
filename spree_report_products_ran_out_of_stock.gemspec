# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_report_products_ran_out_of_stock'
  s.version     = '3.0.4'
  s.summary     = 'Spree 3.0.4 extension for reporting products that ran out of stock'
  s.description = 'This extension lists all products(SKU) which ran out of stock in a given date range'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Cassio S. Cabral'
  s.email     = 'cassioscabral@gmail.com'
  s.homepage  = 'http://cassioscabral.github.io/'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.4'
  s.add_dependency 'spree_backend', '~> 3.0.4'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
