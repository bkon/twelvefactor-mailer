require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end

require "codecov"
SimpleCov.formatters = [
  SimpleCov::Formatter::Codecov,
  SimpleCov::Formatter::HTMLFormatter
]

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "twelvefactor/environment/mailer"
