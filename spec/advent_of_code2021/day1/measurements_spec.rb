# frozen_string_literal: true

require "advent_of_code2021/day1/measurements"

RSpec.describe AdventOfCode2021::Day1::Measurements do
  subject(:measurements) { described_class.new(values) }

  let(:values) { [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] }

  describe "#increments" do
    it do
      expect(measurements.increments).to eq 7
    end
  end
end
