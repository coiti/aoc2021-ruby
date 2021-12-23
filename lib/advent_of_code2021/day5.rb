# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day5/line"

module AdventOfCode2021
  class Day5 < Day
    def part1
      lines
        .flat_map(&:to_a)
        .tally
        .count { |_point, count| count >= 2 }
    end

    private

    def lines
      super
        .map(&Line.method(:parse))
        .filter { |line| line.horizontal? || line.vertical? }
    end
  end
end
