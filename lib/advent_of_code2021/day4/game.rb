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

    def winners
      @winners ||= numbers.reduce([]) do |winners, number|
        playing_boards = boards - winners

        playing_boards.each do |board|
          board.mark(number)
        end

        winners + playing_boards.filter(&:winner?)
      end
    end
  end
end
