require_relative "chef_aix_resources/version"

module ChefAixResources
  COMPONENTS = {
    "Chef::Provider::Cron::Aix" => "chef_aix_resources/provider/cron/aix",
    "Chef::Provider::Group::Aix" => "chef_aix_resources/provider/group/aix",
    "Chef::Provider::Ifconfig::Aix" => "chef_aix_resources/provider/ifconfig/aix",
    "Chef::Provider::Mount::Aix" => "chef_aix_resources/provider/mount/aix",
    "Chef::Provider::Package::Bff" => "chef_aix_resources/provider/package/bff",
    "Chef::Provider::Service::Aix" => "chef_aix_resources/provider/service/aix",
    "Chef::Provider::Service::AixInit" => "chef_aix_resources/provider/service/aixinit",
    "Chef::Provider::User::Aix" => "chef_aix_resources/provider/user/aix",
    "Chef::Resource::BffPackage" => "chef_aix_resources/resource/bff_package",
    "Chef::Resource::User::AixUser" => "chef_aix_resources/resource/user/aix_user",
  }.freeze

  class << self
    def load!
      return true if @loaded

      require "chef" unless defined?(Chef::Resource) && defined?(Chef::Provider)

      COMPONENTS.each do |constant_name, path|
        require_relative path unless constant_defined?(constant_name)
      end

      @loaded = true
    end

    def loaded?
      @loaded == true
    end

    private

    def constant_defined?(qualified_name)
      namespace = Object

      qualified_name.split("::").reject(&:empty?).each do |name|
        return false unless namespace.const_defined?(name, false)

        namespace = namespace.const_get(name, false)
      end

      true
    end
  end
end

ChefAixResources.load!
