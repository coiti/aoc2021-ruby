# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day5/point"

module AdventOfCode2021
  class Day5 < Day
    Line = Struct.new(:begin, :end) do
      def self.parse(input)
        begin_point, end_point =
          input
            .split(" -> ")
            .map(&Point.method(:parse))

        new begin_point, end_point
      end

      def inspect
        "#<#{self.class.name} #{self}>"
      end

      def to_s
        "#{self.begin} -> #{self.end}"
      end

      def to_a
        if horizontal?
          Range
            .new(*[self.begin.x, self.end.x].minmax)
            .map { |x| Point.new(x, self.begin.y) }
        elsif vertical?
          Range
            .new(*[self.begin.y, self.end.y].minmax)
            .map { |y| Point.new(self.begin.x, y) }
        else
          super
        end
      end

      def horizontal?
        self.begin.y == self.end.y
      end

      def vertical?
        self.begin.x == self.end.x
      end
    end
  end
end
