# frozen_string_literal: true

require "advent_of_code2021/day"
require "advent_of_code2021/day4/game"

module AdventOfCode2021
  class Day4 < Day
    def part1
      game.winners.first.score
    end

    def part2
      game.winners.last.score
    end

    private

    def game
      @game ||= Game.parse(input)
    end
  end
end
