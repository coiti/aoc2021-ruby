# frozen_string_literal: true

require "advent_of_code2021/day2"

RSpec.describe AdventOfCode2021::Day2 do
  subject(:day2) { described_class.new(input) }

  let(:sample_input) do
    <<~INPUT
      forward 5
      down 5
      forward 8
      up 3
      down 8
      forward 2
    INPUT
  end

  let(:puzzle_input) { read "day2" }

  describe "#part1" do
    context "with sample input" do
      let(:input) { sample_input }

      it do
        expect(day2.part1).to eq 150
      end
    end

    context "with puzzle input" do
      let(:input) { puzzle_input }

      it do
        expect(day2.part1).to eq 1_484_118
      end
    end
  end
end
