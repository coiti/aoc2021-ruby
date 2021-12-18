# frozen_string_literal: true

module AdventOfCode2021
  class Day2 < Day
    class Position < Struct.new(:horizontal, :depth, :aim, keyword_init: true)
      def self.after(commands)
        new.tap do |position|
          position.execute!(commands)
        end
      end

      def initialize(horizontal: 0, depth: 0, aim: 0)
        super
      end

      def execute!(commands)
        commands.each do |command|
          case command.direction
          when :forward
            self.horizontal += command.units
            self.depth += command.units * aim
          when :down
            self.aim += command.units
          when :up
            self.aim -= command.units
          end
        end
      end
    end
  end
end
