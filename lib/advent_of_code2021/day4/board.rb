# frozen_string_literal: true

require "advent_of_code2021/day"

module AdventOfCode2021
  class Day4 < Day
    class Board
      attr_reader :numbers

      def self.parse(input)
        numbers = input.split(" ").map(&:to_i)

        new numbers
      end

      def initialize(numbers)
        @numbers = numbers
      end

      def to_s
        "Bingo board (rows: #{rows.map { |row| row.join(" ") }.join(", ")})"
      end

      def ==(other)
        numbers == other.numbers && marked == other.marked
      end

      def format
        rows
          .map { |row| row.map { |n| n.to_s.rjust(2) }.join(" ") }
          .join("\n")
      end

      def score
        unmarked.sum * marked.last
      end

      def winner?
        marked_row? || marked_column?
      end

      def marked?(number)
        marked.include?(number)
      end

      def mark(number)
        return false unless numbers.include?(number)

        marked << number

        true
      end

      def marked
        @marked ||= []
      end

      private

      def marked_row?
        rows.any? { |row| (row - marked).empty? }
      end

      def marked_column?
        columns.any? { |column| (column - marked).empty? }
      end

      def rows
        numbers.each_slice(5)
      end

      def columns
        numbers
          .group_by
          .with_index { |_number, index| index % 5 }
          .values
      end

      def unmarked
        numbers - marked
      end
    end
  end
end
