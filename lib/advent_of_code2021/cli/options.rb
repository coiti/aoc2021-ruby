# frozen_string_literal: true

module AdventOfCode2021
  class CLI
    class Options < Struct.new(:part)
      def self.from(parser)
        new.tap do |options|
          parser.parse!(into: options)
        end
      end

      def validate!
        raise OptionParser::MissingArgument, "part" if part.nil?
      end
    end
  end
end
