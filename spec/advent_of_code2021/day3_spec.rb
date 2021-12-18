# frozen_string_literal: true

DayHelper.day 3 do
  sample <<~INPUT
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
  INPUT

  part 1 do
    with_sample_input 198
    with_puzzle_input 3_959_450
  end
end
