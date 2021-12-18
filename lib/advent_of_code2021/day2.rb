# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day2/position"

module AdventOfCode2021
  class Day2 < Day
    Command = Struct.new(:direction, :units)

    def part1
      position.horizontal * position.aim
    end

    def part2
      position.horizontal * position.depth
    end

    private

    def position
      @position ||= Position.after(commands)
    end

    def commands
      @commands ||= input.map do |command|
        direction, units = command.split(" ")

        Command.new(direction.to_sym, units.to_i)
      end
    end
  end
end
