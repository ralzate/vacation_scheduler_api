require 'rails_helper'
require 'database_cleaner'

RSpec.configure do |config|
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :request) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.define_derived_metadata(file_path: Regexp.new('/spec/')) do |metadata|
    if metadata[:type].nil? && metadata[:file_path] =~ %r{/spec/requests/}
      metadata[:type] = :request
    end
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end