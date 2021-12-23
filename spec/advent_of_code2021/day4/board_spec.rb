# frozen_string_literal: true

require "advent_of_code2021/day4/board"

RSpec.describe AdventOfCode2021::Day4::Board do
  subject(:board) { described_class.new(numbers) }

  let(:numbers) do
    [
      14, 21, 17, 24, 4,
      10, 16, 15, 9, 19,
      18, 8, 23, 26, 20,
      22, 11, 13, 6, 5,
      2, 0, 12, 3, 7
    ]
  end

  let(:input) do
    <<~BOARD.strip
      14 21 17 24  4
      10 16 15  9 19
      18  8 23 26 20
      22 11 13  6  5
       2  0 12  3  7
    BOARD
  end

  describe ".parse" do
    it "parses a string into a board" do
      board = described_class.parse(input)

      expect(board.numbers).to eq numbers
    end
  end

  describe "#format" do
    it "returns the original input" do
      board = described_class.parse(input)

      expect(board.format).to eq input
    end
  end

  describe "#mark" do
    context "number is in the board" do
      it "marks the number" do
        board.mark(17)

        expect(board.marked?(17)).to be true
      end
    end

    context "number is not in the board" do
      it "does not mark the number" do
        board.mark(1)

        expect(board.marked?(1)).to be false
      end
    end
  end

  describe "#winner?" do
    context "after no number is marked" do
      it "has not won" do
        expect(board).to_not be_winner
      end
    end

    context "after having marked 5 numbers in the same row" do
      it "has won" do
        numbers
          .slice(0..4)
          .each(&board.method(:mark))

        expect(board).to be_winner
      end
    end

    context "after having marked 5 numbers in the same column" do
      it "has won" do
        board.mark(numbers[0])
        board.mark(numbers[5])
        board.mark(numbers[10])
        board.mark(numbers[15])
        board.mark(numbers[20])

        expect(board).to be_winner
      end
    end

    context "after having marked 5 numbers in a diagonal" do
      it "has not won" do
        board.mark(numbers[0])
        board.mark(numbers[6])
        board.mark(numbers[12])
        board.mark(numbers[18])
        board.mark(numbers[24])

        expect(board).to_not be_winner
      end
    end
  end

  describe "#score" do
    it "returns the correct score" do
      draws = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]

      draws.each(&board.method(:mark))

      expect(board.score).to eq 4512
    end
  end
end
