# frozen_string_literal: true

module AdventOfCode2021
  class Day3 < Day
    class Report
      attr_reader :values

      def initialize(values = [])
        @values = values
      end

      def power_consumption
        epsilon_rate * gamma_rate
      end

      def epsilon_rate
        rates[:epsilon]
      end

      def gamma_rate
        rates[:gamma]
      end

      def life_support_rating
        oxygen_generator_rating * co2_scrubber_rating
      end

      def oxygen_generator_rating
        @oxygen_generator_rating ||= rating :max, default: "1"
      end

      def co2_scrubber_rating
        @co2_scrubber_rating ||= rating :min, default: "0"
      end

      protected

      def rating(criteria, default:, from: 0)
        return values.first.to_i(2) if values.size == 1

        tally = tally_at from
        bit =
          if tally.values.uniq.size > 1
            extract_bit tally, criteria
          else
            default
          end

        Report
          .new(values.filter { |number| number[from] == bit })
          .rating(criteria, default: default, from: from + 1)
      end

      private

      def rates
        return @rates unless @rates.nil?

        rates =
          values.first.size.times.reduce({epsilon: "", gamma: ""}) do |rates, n|
            tally = tally_at n

            rates.merge({
              epsilon: extract_bit(tally, :min),
              gamma: extract_bit(tally, :max)
            }) { |_key, older, newer| older + newer }
          end

        @rates = rates.transform_values { |number| number.to_i(2) }
      end

      def extract_bit(tally, criteria)
        bit, _count =
          tally.public_send("#{criteria}_by") { |_bit, count| count }

        bit
      end

      def tally_at(position)
        values.map { |number| number[position] }.tally
      end
    end
  end
end
