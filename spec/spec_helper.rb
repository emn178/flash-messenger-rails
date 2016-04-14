require 'simplecov'
require 'coveralls'

SimpleCov.add_filter "/spec/"
SimpleCov.add_filter "engine.rb"

if ENV["COVERAGE"]
  SimpleCov.start
elsif ENV["COVERALLS"]
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'flash-messenger'
require 'action_view'
require 'active_record'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each do |file|
  require file
end

RSpec.configure do |config|
  config.after(:each) do
    RequestStore.clear!
  end
end
