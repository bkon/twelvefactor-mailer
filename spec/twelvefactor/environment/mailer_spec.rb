RSpec.describe Twelvefactor::Environment::Mailer do
  let(:app) { double("APP") }

  describe ".apply" do
    subject do
      described_class.apply app, url
    end

    context "when URL has a known schema" do
      let(:url) do
        URI("letter-opener://localhost")
      end

      it "delegates to a schema handler" do
        expect(Twelvefactor::Environment::Mailer::LetterOpener)
          .to receive(:apply).with(app, url)

        subject
      end
    end

    context "when URL schema is not known" do
      let(:url) do
        URI("foo://server")
      end

      it "falls back to the test delivery method" do
        expect(Twelvefactor::Environment::Mailer::Test)
          .to receive(:apply).with(app, url)

        subject
      end
    end
  end
end
