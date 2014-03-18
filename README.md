# TelFormatter

Format your telephone numbers.

## Notice

I am not assuming this gem will be used outside Japan.

## Installation

Add this line to your application's Gemfile:

    gem 'tel_formatter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tel_formatter

## Usage

```ruby
Telformatter.format("0312345678") #=> "03-1234-5678"
Telformatter.format("０３．１２３５．５６７８") #=> "03-1234-5678"
```

## Contributing

1. Fork it ( http://github.com/iTakeshi/tel_formatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Write spec and run tests (`bundle exec rspec`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
