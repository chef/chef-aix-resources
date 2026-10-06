require "spec_helper"

describe Chef::Resource::BffPackage do
  subject(:resource) { described_class.new("example") }

  it "defaults to installing a package" do
    expect(resource.action).to eq([:install])
  end

  it "supports the package actions inherited from package" do
    %i{install lock purge reconfig remove unlock upgrade}.each do |action|
      expect { resource.action(action) }.not_to raise_error
    end
  end

  it "resolves the AIX package provider for the bff_package resource" do
    expect(resource.provider_for_action(:install)).to be_a(Chef::Provider::Package::Bff)
  end
end
