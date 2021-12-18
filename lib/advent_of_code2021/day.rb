# frozen_string_literal: true

module AdventOfCode2021
  class Day
    def initialize(input)
      @input = input.lines(chomp: true)
    end

    def part(part)
      method_name = "part#{part}"

      raise Error, "invalid part: #{part}" unless respond_to? method_name

      public_send method_name
    end

    private

    attr_reader :input
  end
end
