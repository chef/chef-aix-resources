require "spec_helper"

describe Chef::Provider::Group::Aix do
  let(:node) { Chef::Node.new }
  let(:run_context) { Chef::RunContext.new(node, {}, Chef::EventDispatch::Dispatcher.new) }
  let(:resource) { Chef::Resource::Group.new("developers", run_context) }
  let(:provider) { described_class.new(resource, run_context) }

  it "uses the AIX group management binaries" do
    expect(provider.required_binaries).to eq(%w{/usr/bin/mkgroup /usr/bin/chgroup /usr/bin/chgrpmem /usr/sbin/rmgroup})
  end

  it "renders an AIX group id option" do
    resource.gid "200"
    provider.current_resource = Chef::Resource::Group.new("developers", run_context)

    expect(provider.set_options).to eq(["id=200"])
  end
end
