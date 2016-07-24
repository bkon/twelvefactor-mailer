# twelvefactor-mailer

Adds support for MAILER_URL environment variable in a way similar to
[http://edgeguides.rubyonrails.org/configuring.html](DATABASE_URL).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twelvefactor-mailer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twelvefactor-mailer

## Usage

1. Add `MAILER_URL` to your application environment.

```
MAILER_URL=letter-opener://localhost
MAILER_URL=test://localhost
MAILER_URL=smtp://mail:1025
```

2. Remove old mailer configuration code (`action_mailer.delivery_method` and
`action_mailer.smtp_settings`) from `application.rb` and `ENV.rb`

### Supported delivery methods

smtp

```
MAILER_URL=smtp://user:password@localhost:1025?domain=test.com&authentication=plain
```

sendmail
```
MAILER_URL=sendmail:///usr/bin/sendmail?-i%20-t
```

file
```
MAILER_URL=file:///home/username/tmp/mail
```

test
```
MAILER_URL=test://localhost
```

letter-opener (https://github.com/ryanb/letter_opener)
```
MAILER_URL=letter-opener://localhost
```

## Development

After checking out the repo, run `bin/setup` to install
dependencies. Then, run `rake spec` to run the tests. You can also run
`bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake
install`.  To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will
create a git tag for the version, push git commits and tags, and push
the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/bkon/twelvefactor.  This project is intended to be
a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
