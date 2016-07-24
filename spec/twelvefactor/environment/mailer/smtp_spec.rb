require "ostruct"

RSpec.describe Twelvefactor::Environment::Mailer::Smtp do
  let(:config) { OpenStruct.new }
  let(:app) { double("App") }
  let(:url) { "smtp://user:password@mail:1025?domain=test.com" }

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
    it { should eq :smtp }
  end

  describe "delivery method settings" do
    subject { action; config.smtp_settings }

    context "when URL includes SMTP server credentials" do
      let(:url) { "smtp://user:password@server?domain=test.com" }
      let(:expected_settings) do
        Hash[
          address: "server",
          user_name: "user",
          password: "password",
          domain: "test.com"
        ]
      end

      it { should eq expected_settings }
    end

    context "when URL does not include SMTP server credentials" do
      let(:url) { "smtp://mail:1025" }
      let(:expected_settings) do
        Hash[
          address: "mail",
          port: 1025
        ]
      end

      it { should eq expected_settings }
    end
  end
end
