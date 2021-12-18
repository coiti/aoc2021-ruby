# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day1/measurements"

module AdventOfCode2021
  class Day1 < Day
    def part1
      Measurements.new(measurements).increments
    end

    def part2
      Measurements
        .new(measurements.each_cons(3).map(&:sum))
        .increments
    end

    private

    def measurements
      @measurements ||= input.map(&:to_i)
    end
  end
end
