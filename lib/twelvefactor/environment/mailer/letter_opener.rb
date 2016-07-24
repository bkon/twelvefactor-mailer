# frozen_string_literal: true
class Twelvefactor::Environment::Mailer::LetterOpener
  def self.apply app, _
    config = app.config
    config.action_mailer.delivery_method = :letter_opener
  end
end
