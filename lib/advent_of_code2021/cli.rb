# frozen_string_literal: true

require "advent_of_code2021/day1"

module AdventOfCode2021
  class CLI
    def start
      return if input.nil?

      puts Day1.new(input).part1
    end

    private

    def input
      return @input if instance_variable_defined? :@input

      @input = gets nil
    end
  end
end
