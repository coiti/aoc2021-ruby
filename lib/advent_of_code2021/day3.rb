# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day3/report"

module AdventOfCode2021
  class Day3 < Day
    def part1
      report.power_consumption
    end

    def part2
      report.life_support_rating
    end

    private

    def report
      @report ||= Report.new(input)
    end
  end
end
