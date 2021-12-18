# AdventOfCode2021

This is my solution for the
[Advent of Code 2021](https://adventofcode.com/2021), written in Ruby.

## Usage

To run this, clone/extract this project into a local directory and set it up:

```sh
bin/setup
```

You can then run it by passing an input, and the part of the day to solve:
You can then run it by passing an input, the day of the advent the input
corresponds to, and the part of the day to solve for the input:

```sh
bundle exec exe/aoc21 --day 1 --part 1 spec/input/day1.txt
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on
[GitHub](https://github.com/coiti/aoc21-ruby).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
