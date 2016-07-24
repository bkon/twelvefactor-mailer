require "ostruct"

RSpec.describe Twelvefactor::Environment::Mailer::File do
  let(:config) { OpenStruct.new }
  let(:app) { double("App") }
  let(:url) { "file:///home/username/tmp/mail" }

  let(:action) do
    described_class.apply app, URI(url)
  end

  before do
    allow(app)
      .to receive_message_chain(:config, :action_mailer)
      .and_return(config)
  end

  describe "delivery method" do
    subject { action; config.delivery_method }
    it { should eq :file }
  end

  describe "delivery method settings" do
    subject { action; config.file_settings }

    let(:expected_settings) do
      Hash[
        location: "/home/username/tmp/mail",
      ]
    end

    it { should eq expected_settings }
  end
end
