require "spec_helper"

describe Chef::Resource::User::AixUser do
  subject(:resource) { described_class.new("aix-user") }

  it "keeps the AIX user resource available under its explicit name" do
    expect(resource).to be_a(Chef::Resource::User)
    expect(resource.resource_name).to eq(:aix_user)
  end
end
