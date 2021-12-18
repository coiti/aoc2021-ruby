# frozen_string_literal: true

require "advent_of_code2021/day2"
require "advent_of_code2021/day2/position"

RSpec.describe AdventOfCode2021::Day2::Position do
  subject(:position) { described_class.new }

  let(:commands) do
    [
      AdventOfCode2021::Day2::Command.new(:forward, 5),
      AdventOfCode2021::Day2::Command.new(:down, 5),
      AdventOfCode2021::Day2::Command.new(:forward, 8),
      AdventOfCode2021::Day2::Command.new(:up, 3),
      AdventOfCode2021::Day2::Command.new(:down, 8),
      AdventOfCode2021::Day2::Command.new(:forward, 2)
    ]
  end

  describe "#execute!" do
    it "parses the commands" do
      position.execute!(commands)

      expect(position.horizontal).to eq 15
      expect(position.aim).to eq 10
      expect(position.depth).to eq 60
    end
  end
end
