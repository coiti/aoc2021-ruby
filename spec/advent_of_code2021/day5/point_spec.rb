# frozen_string_literal: true

require "advent_of_code2021/day5/point"

RSpec.describe AdventOfCode2021::Day5::Point do
  describe ".parse" do
    it "parses a string into a point" do
      input = "0,9"

      point = described_class.parse(input)

      expect(point).to have_attributes({x: 0, y: 9})
    end
  end

  describe "#to_s" do
    it "returns the original input" do
      input = "3,4"

      point = described_class.parse(input)

      expect(point.to_s).to eq input
    end
  end
end
