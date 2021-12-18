# frozen_string_literal: true

require "advent_of_code2021/day"

module AdventOfCode2021
  class Day3 < Day
    def part1
      epsilon_rate = ""
      gamma_rate = ""

      input.first.size.times do |n|
        epsilon_bit, gamma_bit =
          input
            .map { |number| number[n] }
            .tally
            .invert
            .minmax
            .map { |_count, bit| bit }

        epsilon_rate += epsilon_bit
        gamma_rate += gamma_bit
      end

      epsilon_rate.to_i(2) * gamma_rate.to_i(2)
    end
  end
end
