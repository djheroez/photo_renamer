# PhotoRenamer

## Installation

1. Build

```ruby
gem build photo_renamer
```

2. Install

```ruby
gem install photo_renamer
```

## Usage

```ruby
require 'photo_renamer'

PhotoRenamer.rename("photo.jpg, Krakow, 2013-09-05 14:08:15\nMike.png, London, 2015-06-20 15:13:22")
```

## Development

Run `bundle install` and then `bundle exec rspec spec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/djheroez/photo_renamer.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
