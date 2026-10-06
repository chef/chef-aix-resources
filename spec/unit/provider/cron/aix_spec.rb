require "spec_helper"

describe Chef::Provider::Cron::Aix do
  let(:node) { Chef::Node.new }
  let(:run_context) { Chef::RunContext.new(node, {}, Chef::EventDispatch::Dispatcher.new) }
  let(:resource) { Chef::Resource::Cron.new("aix cron", run_context) }
  let(:provider) { described_class.new(resource, run_context) }

  it "renders an AIX cron entry without environment settings" do
    resource.minute "5"
    resource.hour "4"
    resource.day "*"
    resource.month "*"
    resource.weekday "*"
    resource.command "/usr/bin/true"

    expect(provider.send(:get_crontab_entry)).to eq("# Chef Name: aix cron\n5 4 * * * /usr/bin/true\n")
  end

  it "rejects environment properties unsupported by AIX cron" do
    resource.mailto "root@example.test"

    expect { provider.send(:get_crontab_entry) }.to raise_error(Chef::Exceptions::Cron, /environment variables/)
  end

  it "rejects timeouts unsupported by AIX cron" do
    resource.time_out("duration" => "10")

    expect { provider.send(:get_crontab_entry) }.to raise_error(Chef::Exceptions::Cron, /timeout/)
  end
end
