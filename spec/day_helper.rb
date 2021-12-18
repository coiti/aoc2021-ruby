# frozen_string_literal: true

module DayHelper
  def self.day(day, &block)
    klass = AdventOfCode2021.day(day)

    RSpec.describe(klass) do
      let(:puzzle_input) do
        path = File.expand_path("input/day#{day}.txt", __dir__)
        File.read(path)
      end

      instance_eval(&block)
    end
  end

  def sample(input)
    let(:sample_input) { input }
  end

  def part(part, &block)
    describe "#part#{part}" do
      subject { described_class.new(input).part(part) }

      instance_eval(&block)
    end
  end

  def with_sample_input(result)
    compare_between :sample, result, from: caller
  end

  def with_puzzle_input(result)
    compare_between :puzzle, result, from: caller
  end

  private

  def compare_between(input, result, from:)
    context "with #{input} input" do
      let(:input) { __send__ "#{input}_input" }

      it nil, caller: from do
        is_expected.to eq result
      end
    end
  end
end
