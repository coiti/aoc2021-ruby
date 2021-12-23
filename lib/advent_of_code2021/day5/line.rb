# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day5/point"

module AdventOfCode2021
  class Day5 < Day
    Line = Struct.new(:begin, :end) do
      include Enumerable

      alias_method :points, :entries

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

      def each
        yield self.begin

        each_between do |point|
          yield point
        end

        yield self.end
      end

      def length
        return @length unless @length.nil?

        deltas = %i[x y].map do |axis|
          min, max = [self.begin, self.end].map(&axis).minmax

          max - min
        end

        @length = deltas.max + 1
      end

      alias_method :size, :length

      def horizontal?
        self.begin.y == self.end.y
      end

      def vertical?
        self.begin.x == self.end.x
      end

      private

      def each_between
        middle = size - 2

        (1..middle).each do |n|
          yield Point.new(
            self.begin.x + (n * (self.end.x <=> self.begin.x)),
            self.begin.y + (n * (self.end.y <=> self.begin.y))
          )
        end
      end
    end
  end
end
