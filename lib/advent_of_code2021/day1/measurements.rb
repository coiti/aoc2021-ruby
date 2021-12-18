# frozen_string_literal: true

module AdventOfCode2021
  class Day1 < Day
    class Measurements
      def initialize(measurements)
        @measurements = measurements
      end

      def increments
        @measurements
          .each_cons(2)
          .count { |older, newer| newer > older }
      end
    end
  end
end
