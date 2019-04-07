# TelFormatter

[![Build Status](https://travis-ci.org/iTakeshi/tel_formatter.png?branch=master)](https://travis-ci.org/iTakeshi/tel_formatter)
[![Coverage Status](https://coveralls.io/repos/iTakeshi/tel_formatter/badge.png)](https://coveralls.io/r/iTakeshi/tel_formatter)

Format your telephone numbers.

## Notice

This gem is only applicable for Japanese phone number formatting.

## Installation

Add this line to your application's Gemfile:

    gem 'tel_formatter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tel_formatter

## Usage

```ruby
require 'tel_formatter'

TelFormatter.format("0312345678") #=> "03-1234-5678"
TelFormatter.format("０３．１２３５．５６７８") #=> "03-1234-5678"
```

## Contributing

1. Fork it ( http://github.com/iTakeshi/tel_formatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write spec and run tests (`bundle exec rspec`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
