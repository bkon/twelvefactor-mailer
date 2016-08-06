# frozen_string_literal: true

module Twelvefactor; end
module Twelvefactor::Environment; end
class Twelvefactor::Environment::Mailer; end

require "twelvefactor/environment/mailer/smtp"
require "twelvefactor/environment/mailer/sendmail"
require "twelvefactor/environment/mailer/file"
require "twelvefactor/environment/mailer/test"
require "twelvefactor/environment/mailer/letter_opener"

class Twelvefactor::Environment::Mailer
  VERSION = "1.0.1".freeze

  HANDLERS = {
    "smtp" => Smtp,
    "sendmail" => Sendmail,
    "file" => File,
    "test" => Test,
    "letter-opener" => LetterOpener
  }.freeze

  def self.apply app, mailer_url
    handler = HANDLERS.fetch mailer_url.scheme, Test
    handler.apply app, mailer_url
  end
end
