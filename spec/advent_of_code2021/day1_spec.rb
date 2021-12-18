# frozen_string_literal: true

require "advent_of_code2021/day1"

RSpec.describe AdventOfCode2021::Day1 do
  describe "#part1" do
    context "with sample input" do
      it do
        input = <<~INPUT
          199
          200
          208
          210
          200
          207
          240
          269
          260
          263
        INPUT

        day = described_class.new(input)

        expect(day.part1).to eq 7
      end
    end

    context "with puzzle input" do
      it do
        input = read "day1"

        day = described_class.new(input)

        expect(day.part1).to eq 1521
      end
    end
  end
end
