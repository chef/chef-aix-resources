$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

chef_path = ENV["CHEF_PATH"]

if chef_path
  chef_path = File.expand_path(chef_path)
  $LOAD_PATH.unshift File.join(chef_path, "lib")
  $LOAD_PATH.unshift File.join(chef_path, "chef-config", "lib")
  $LOAD_PATH.unshift File.join(chef_path, "chef-utils", "lib")
end

require "rspec"
require "chef"
require "chef_aix_resources"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end
end
