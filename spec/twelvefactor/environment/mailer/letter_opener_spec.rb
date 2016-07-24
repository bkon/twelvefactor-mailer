require "ostruct"

RSpec.describe Twelvefactor::Environment::Mailer::LetterOpener do
  let(:config) { OpenStruct.new }
  let(:app) { double("App") }
  let(:url) { "letter-opener://localhost" }

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
    it { should eq :letter_opener }
  end
end
