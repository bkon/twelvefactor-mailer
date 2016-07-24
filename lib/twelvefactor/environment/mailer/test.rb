# frozen_string_literal: true
class Twelvefactor::Environment::Mailer::Test
  def self.apply app, _
    config = app.config
    config.action_mailer.delivery_method = :test
  end
end
