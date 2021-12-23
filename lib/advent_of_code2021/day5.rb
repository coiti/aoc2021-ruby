# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day5/line"

module AdventOfCode2021
  class Day5 < Day
    def part1
      intersecting lines.filter { |line| line.horizontal? || line.vertical? }
    end

    def part2
      intersecting lines
    end

    private

    def intersecting(lines)
      lines
        .flat_map(&:points)
        .tally
        .count { |_point, count| count >= 2 }
    end

    def lines
      super.map(&Line.method(:parse))
    end
  end
end
