# frozen_string_literal: true

require "advent_of_code2021/day"

module AdventOfCode2021
  class Day5 < Day
    Point = Struct.new(:x, :y) do
      def self.parse(input)
        x, y = input.split(",").map(&:to_i)

        new x, y
      end

      def inspect
        "#<#{self.class.name} #{self}>"
      end

      def to_s
        "#{x},#{y}"
      end
    end
  end
end
