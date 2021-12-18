# frozen_string_literal: true

DayHelper.day 1 do
  sample <<~INPUT
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
  INPUT

  part 1 do
    with_sample_input 7
    with_puzzle_input 1521
  end

  part 2 do
    with_sample_input 5
    with_puzzle_input 1543
  end
end
