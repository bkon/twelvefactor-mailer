require "ostruct"

RSpec.describe Twelvefactor::Environment::Mailer::Sendmail do
  let(:config) { OpenStruct.new }
  let(:app) { double("App") }
  let(:url) { "sendmail:///usr/bin/sendmail?-i%20-t" }

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
    it { should eq :sendmail }
  end

  describe "delivery method settings" do
    subject { action; config.sendmail_settings }

    context "when URL includes query" do
      let(:url) { "sendmail:///usr/bin/sendmail?-i%20-t" }
      let(:expected_settings) do
        Hash[
          location: "/usr/bin/sendmail",
          arguments: "-i -t"
        ]
      end

      it { should eq expected_settings }
    end

    context "when URL does not include query" do
      let(:url) { "sendmail:///usr/sbin/mail" }
      let(:expected_settings) do
        Hash[
          location: "/usr/sbin/mail",
        ]
      end

      it { should eq expected_settings }
    end
  end
end
