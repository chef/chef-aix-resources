source "https://rubygems.org"

chef_path = ENV["CHEF_PATH"]

if chef_path && File.directory?(File.expand_path(chef_path))
  gem "chef", path: File.expand_path(chef_path)
else
  gem "chef", ">= 19.0", "< 20.0"
end

gem "rake", ">= 13.0"
gem "rspec", ">= 3.12"
gem "cookstyle", ">= 9.0", require: false
