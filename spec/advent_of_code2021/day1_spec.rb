# frozen_string_literal: true

require "advent_of_code2021/day1"

RSpec.describe AdventOfCode2021::Day1 do
  subject(:day1) { described_class.new(input) }

  let(:sample_input) do
    <<~INPUT
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
  end

  let(:puzzle_input) { read "day1" }

  describe "#part1" do
    context "with sample input" do
      let(:input) { sample_input }

      it do
        expect(day1.part1).to eq 7
      end
    end

    context "with puzzle input" do
      let(:input) { puzzle_input }

      it do
        expect(day1.part1).to eq 1521
      end
    end
  end

  describe "#part2" do
    context "with sample input" do
      let(:input) { sample_input }

      it do
        expect(day1.part2).to eq 5
      end
    end

    context "with puzzle input" do
      let(:input) { puzzle_input }

      it do
        expect(day1.part2).to eq 1543
      end
    end
  end
end
