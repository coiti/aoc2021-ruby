# frozen_string_literal: true

require "advent_of_code2021/day"

module AdventOfCode2021
  class Day2 < Day
    Command = Struct.new(:direction, :units)
    Position = Struct.new(:horizontal, :depth)

    def part1
      position = Position.new(0, 0)

      commands.each do |command|
        case command.direction
        when :forward
          position.horizontal += command.units
        when :down
          position.depth += command.units
        when :up
          position.depth -= command.units
        end
      end

      position.horizontal * position.depth
    end

    private

    def commands
      @commands ||= input.map do |command|
        direction, units = command.split(" ")

        Command.new(direction.to_sym, units.to_i)
      end
    end
  end
end
