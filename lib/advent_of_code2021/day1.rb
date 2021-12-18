# frozen_string_literal: true

module AdventOfCode2021
  class Day1
    def initialize(input)
      @input = input
    end

    def part1
      input
        .lines(chomp: true)
        .map(&:to_i)
        .each_cons(2)
        .count { |older, newer| newer > older }
    end

    private

    attr_reader :input
  end
end
