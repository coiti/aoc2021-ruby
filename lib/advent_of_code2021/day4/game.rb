# frozen_string_literal: true

require "advent_of_code2021/day4/board"

class AdventOfCode2021::Day4
  class Game
    attr_reader :boards, :numbers

    def self.parse(input)
      numbers, *boards = input.split("\n\n")

      new \
        boards: boards.map(&Board.method(:parse)),
        numbers: numbers.split(",").map(&:to_i)
    end

    def initialize(boards: [], numbers: [])
      @boards = boards
      @numbers = numbers
    end

    def to_s
      "Bingo (boards: #{boards.size}, numbers: #{numbers.join(" ")})"
    end

    def format
      [numbers.join(","), *boards.map(&:format)].join("\n\n")
    end

    def winner
      return @winner if instance_variable_defined? :@winner

      numbers.each do |number|
        boards.each do |board|
          board.mark(number)

          return @winner = board if board.winner?
        end
      end

      @winner = nil
    end
  end
end
