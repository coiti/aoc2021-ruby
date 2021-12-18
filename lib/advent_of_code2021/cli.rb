# frozen_string_literal: true

require "optparse"

require "advent_of_code2021/cli/options"
require "advent_of_code2021/day1"

module AdventOfCode2021
  class CLI
    def initialize
      @options = Options.from(option_parser)
      @options.validate!
    rescue OptionParser::InvalidArgument, OptionParser::MissingArgument => e
      warn e.message
      exit false
    end

    def start
      return if input.nil?

      puts Day1.new(input).part(options.part)
    rescue Error => e
      warn e.message
      exit false
    end

    private

    attr_reader :options

    def input
      return @input if instance_variable_defined? :@input

      @input = gets nil
    end

    def option_parser
      @option_parser ||= OptionParser.new do |parser|
        parser.version = AdventOfCode2021::VERSION
        parser.banner = "Usage: #{parser.program_name} OPTIONS FILE"
        parser.separator("\nOPTIONS:")
        parser.on("-p", "--part PART", Integer, "Part of the day to solve.")
      end
    end
  end
end
