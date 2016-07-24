# frozen_string_literal: true
class Twelvefactor::Environment::Mailer::File
  def self.apply app, mailer_url
    config = app.config
    config.action_mailer.delivery_method = :file
    config.action_mailer.file_settings = file_settings mailer_url
  end

  def self.file_settings url
    {
      location: url.path
    }
  end
end
