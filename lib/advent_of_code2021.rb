# frozen_string_literal: true

require_relative "advent_of_code2021/version"

require "advent_of_code2021/day1"
require "advent_of_code2021/day2"
require "advent_of_code2021/day3"

module AdventOfCode2021
  class Error < StandardError; end

  def self.day(day)
    const_get "Day#{day}"
  rescue NameError
    raise Error, "invalid day: #{day}"
  end
end
