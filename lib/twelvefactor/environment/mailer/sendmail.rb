require "active_support/core_ext/hash"

# frozen_string_literal: true
class Twelvefactor::Environment::Mailer::Sendmail
  def self.apply app, mailer_url
    config = app.config
    config.action_mailer.delivery_method = :sendmail
    config.action_mailer.sendmail_settings = sendmail_settings mailer_url
  end

  def self.sendmail_settings url
    {
      location: url.path,
      arguments: url.query && URI.decode(url.query)
    }.compact
  end
end
