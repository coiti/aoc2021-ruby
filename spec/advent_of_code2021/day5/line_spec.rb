# frozen_string_literal: true

require "advent_of_code2021/day5/line"
require "advent_of_code2021/day5/point"

RSpec.describe AdventOfCode2021::Day5::Line do
  before do
    stub_const "Point", AdventOfCode2021::Day5::Point
  end

  describe ".parse" do
    it "parses a string into a line" do
      input = "0,9 -> 5,9"

      line = described_class.parse(input)

      expect(line)
        .to have_attributes({begin: Point.new(0, 9), end: Point.new(5, 9)})
    end
  end

  describe "#to_s" do
    it "returns the original input" do
      input = "0,9 -> 5,9"

      line = described_class.parse(input)

      expect(line.to_s).to eq input
    end
  end

  describe "#points" do
    context "the line is horizontal" do
      context "begin is less than end" do
        it "is an array of all points" do
          line = described_class.parse("0,9 -> 5,9")

          expect(line.points).to eq [
            Point.new(0, 9),
            Point.new(1, 9),
            Point.new(2, 9),
            Point.new(3, 9),
            Point.new(4, 9),
            Point.new(5, 9)
          ]
        end
      end

      context "begin is greater than end" do
        it "is an array of all points" do
          line = described_class.parse("9,4 -> 3,4")

          expect(line.points).to eq [
            Point.new(9, 4),
            Point.new(8, 4),
            Point.new(7, 4),
            Point.new(6, 4),
            Point.new(5, 4),
            Point.new(4, 4),
            Point.new(3, 4)
          ]
        end
      end
    end

    context "the line is vertical" do
      context "begin is less than end" do
        it "is an array of all points" do
          line = described_class.parse("7,0 -> 7,4")

          expect(line.points).to eq [
            Point.new(7, 0),
            Point.new(7, 1),
            Point.new(7, 2),
            Point.new(7, 3),
            Point.new(7, 4)
          ]
        end
      end

      context "begin is greater than end" do
        it "is an array of all points" do
          line = described_class.parse("2,2 -> 2,1")

          expect(line.points).to eq [
            Point.new(2, 2),
            Point.new(2, 1)
          ]
        end
      end
    end

    context "the line is diagonal" do
      it "is an array of all points" do
        line = described_class.parse("8,0 -> 0,8")

        expect(line.points).to eq [
          Point.new(8, 0),
          Point.new(7, 1),
          Point.new(6, 2),
          Point.new(5, 3),
          Point.new(4, 4),
          Point.new(3, 5),
          Point.new(2, 6),
          Point.new(1, 7),
          Point.new(0, 8)
        ]
      end
    end
  end

  describe "#horizontal?" do
    context "the line is horizontal" do
      it do
        line = described_class.parse("0,9 -> 5,9")

        expect(line).to be_horizontal
      end
    end

    context "the line is vertical" do
      it do
        line = described_class.parse("2,2 -> 2,1")

        expect(line).to_not be_horizontal
      end
    end

    context "the line is diagonal" do
      it do
        line = described_class.parse("8,0 -> 0,8")

        expect(line).to_not be_horizontal
      end
    end
  end

  describe "#vertical?" do
    context "the line is horizontal" do
      it do
        line = described_class.parse("0,9 -> 5,9")

        expect(line).to_not be_vertical
      end
    end

    context "the line is vertical" do
      it do
        line = described_class.parse("2,2 -> 2,1")

        expect(line).to be_vertical
      end
    end

    context "the line is diagonal" do
      it do
        line = described_class.parse("8,0 -> 0,8")

        expect(line).to_not be_vertical
      end
    end
  end
end
