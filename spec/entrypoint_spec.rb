require "spec_helper"

describe ChefAixResources do
  it "loads the snapshot idempotently" do
    expect { described_class.load! }.not_to raise_error
    expect(described_class).to be_loaded
  end

  it "exposes every copied AIX implementation" do
    described_class::COMPONENTS.each_key do |constant_name|
      namespace = Object
      constant_name.split("::").reject(&:empty?).each do |name|
        namespace = namespace.const_get(name, false)
      end

      expect(namespace).to be_a(Module)
    end
  end

  it "keeps the AIX resource and provider registrations available" do
    provider = Chef::Resource::BffPackage.new("example").provider_for_action(:install)

    expect(provider).to be_a(Chef::Provider::Package::Bff)
    expect(Chef::Resource::User::AixUser).to be < Chef::Resource::User
    expect(Chef::Provider::User::Aix).to be < Chef::Provider::User
  end
end
