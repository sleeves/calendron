require 'rspec'
require 'spinach-rails'
ENV['RAILS_ENV']='test'
ENV['USE_JASMINE_RAKE']='true'
require_relative '../../config/environment'
require 'capybara-webkit'

Capybara.javascript_driver = :webkit
Capybara.current_driver = Capybara.javascript_driver
