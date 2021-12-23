# frozen_string_literal: true

require "advent_of_code2021/day4/game"

RSpec.describe AdventOfCode2021::Day4::Game do
  subject(:game) { described_class.new(boards: boards, numbers: numbers) }

  let(:input) do
    <<~INPUT.strip
      7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

      22 13 17 11  0
       8  2 23  4 24
      21  9 14 16  7
       6 10  3 18  5
       1 12 20 15 19

       3 15  0  2 22
       9 18 13 17  5
      19  8  7 25 23
      20 11 10 24  4
      14 21 16 12  6

      14 21 17 24  4
      10 16 15  9 19
      18  8 23 26 20
      22 11 13  6  5
       2  0 12  3  7
    INPUT
  end

  let(:numbers) do
    [
      7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22,
      18, 20, 8, 19, 3, 26, 1
    ]
  end

  let(:boards) do
    [
      AdventOfCode2021::Day4::Board.new([
        22, 13, 17, 11, 0,
        8, 2, 23, 4, 24,
        21, 9, 14, 16, 7,
        6, 10, 3, 18, 5,
        1, 12, 20, 15, 19
      ]),
      AdventOfCode2021::Day4::Board.new([
        3, 15, 0, 2, 22,
        9, 18, 13, 17, 5,
        19, 8, 7, 25, 23,
        20, 11, 10, 24, 4,
        14, 21, 16, 12, 6
      ]),
      AdventOfCode2021::Day4::Board.new([
        14, 21, 17, 24, 4,
        10, 16, 15, 9, 19,
        18, 8, 23, 26, 20,
        22, 11, 13, 6, 5,
        2, 0, 12, 3, 7
      ])
    ]
  end

  describe ".parse" do
    it "parses a string into a game" do
      game = described_class.parse(input)

      expect(game).to have_attributes({boards: boards, numbers: numbers})
    end
  end

  describe "#format" do
    it "returns the original input" do
      game = described_class.parse(input)

      expect(game.format).to eq input
    end
  end

  describe "#winners" do
    it "returns the boards in winning order" do
      expect(game.winners).to eq boards.values_at(2, 0, 1)
    end
  end
end
