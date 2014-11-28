# PennSDK: Rubygem for Penn OpenData

[![Build Status](https://travis-ci.org/pennlabs/penn-sdk-ruby.svg)](https://travis-ci.org/pennlabs/penn-sdk-ruby)
[![Code Climate](https://codeclimate.com/github/pennlabs/penn-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/pennlabs/penn-sdk-ruby)

This is the Penn OpenData API implementation in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'penn_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install penn_sdk

## Usage

```ruby
require 'penn_sdk'

registrar = PennSDK::Registrar.new "API_USERNAME", "API_PASSWORD"
registrar.course "CHEM", "242"
```

## Contributing

1. Fork it ( https://github.com/pennlabs/penn-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
