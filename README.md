# Sorted::Actionview

[![Build Status](https://travis-ci.org/mynameisrufus/sorted-actionview.svg?branch=master)](https://travis-ci.org/mynameisrufus/sorted-actionview)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sorted-actionview'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sorted-actionview

## Usage

Generate a sorted link with the email attribute:

```ruby
link_to_sorted "Email", :email
```

Works the same as the `link_to` method except a second argument for the
sort attribute is needed.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sorted-actionview/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
