# frozen_string_literal: true

require "advent_of_code2021/day1/measurements"

module AdventOfCode2021
  class Day1
    def initialize(input)
      @input = input.lines(chomp: true).map(&:to_i)
    end

    def part(part)
      method_name = "part#{part}"

      raise Error, "invalid part: #{part}" unless respond_to? method_name

      public_send method_name
    end

    def part1
      Measurements.new(input).increments
    end

    def part2
      Measurements
        .new(input.each_cons(3).map(&:sum))
        .increments
    end

    private

    attr_reader :input
  end
end
