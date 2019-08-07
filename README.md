# rental-cars

This application is to find cars to rent in Cincinnati Area. It scrapes rentalcars.com for certain input dates.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rental-cars'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rental-cars

## Usage

1- User have to enter valid pick-up date. It cannot be today's date. 
2- User have to enter valid drop-off date. It cannot be before pick-update.
3- The gem will show the list of available cars in Cincinnati between that dates.
4- User can select car to see more details about it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rentalcars.
