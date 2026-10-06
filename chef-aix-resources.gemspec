require_relative "lib/chef_aix_resources/version"

Gem::Specification.new do |spec|
  spec.name = "chef-aix-resources"
  spec.version = ChefAixResources::VERSION
  spec.summary = "Community snapshot of Chef's pre-extraction AIX resources and providers"
  spec.description = "An optional, explicitly loaded snapshot of the AIX-specific Chef resources and providers that were previously bundled with Chef Infra Client."
  spec.authors = ["Community contributors"]
  spec.license = "Apache-2.0"
  spec.homepage = "https://github.com/chef/chef-aix-resources"
  spec.required_ruby_version = ">= 3.0.3"

  spec.add_dependency "chef", ">= 19.0", "< 20.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "cookstyle", "~> 9.0"

  spec.files = %w[
    .gitignore
    Gemfile
    LICENSE
    README.md
    Rakefile
    chef-aix-resources.gemspec
  ] + Dir.glob("lib/**/*.rb") + Dir.glob("spec/**/*.rb")
  spec.require_paths = ["lib"]

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/chef/chef-aix-resources/issues",
    "source_code_uri" => "https://github.com/chef/chef-aix-resources",
  }
end
