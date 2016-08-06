require "active_support/core_ext/hash"

# frozen_string_literal: true
class Twelvefactor::Environment::Mailer::Smtp
  def self.apply app, mailer_url
    config = app.config
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = smtp_settings mailer_url
  end

  def self.smtp_settings url
    basic_settings(url)
      .merge(extra_settings(url.query))
      .compact
  end

  def self.basic_settings url
    {
      address: url.host,
      port: url.port,
      user_name: url.user && URI.unescape(url.user),
      password: url.password && URI.unescape(url.password)
    }
  end

  def self.extra_settings query
    return {} unless query

    CGI
      .parse(query)
      .map { |k, val| [k.to_sym, val.first] }
      .to_h
  end
end
