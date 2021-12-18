# frozen_string_literal: true

require "advent_of_code2021/day3/report"

RSpec.describe AdventOfCode2021::Day3::Report do
  subject(:report) { described_class.new(values) }

  let(:values) do
    %w[
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
    ]
  end

  describe "#epsilon_rate" do
    it do
      expect(report.epsilon_rate).to eq 9
    end
  end

  describe "#gamma_rate" do
    it do
      expect(report.gamma_rate).to eq 22
    end
  end

  describe "#power_consumption" do
    it do
      expect(report.power_consumption).to eq 198
    end
  end

  describe "#oxygen_generator_rating" do
    it do
      expect(report.oxygen_generator_rating).to eq 23
    end
  end

  describe "#co2_scrubber_rating" do
    it do
      expect(report.co2_scrubber_rating).to eq 10
    end
  end

  describe "#life_support_rating" do
    it do
      expect(report.life_support_rating).to eq 230
    end
  end
end
