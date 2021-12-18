# frozen_string_literal: true

module AdventOfCode2021
  class CLI
    class Options < Struct.new(:day, :part)
      def self.from(parser)
        new.tap do |options|
          parser.parse!(into: options)
        end
      end

      def validate!
        each_pair do |name, value|
          raise OptionParser::MissingArgument, name.to_s if value.nil?
        end
      end
    end
  end
end
