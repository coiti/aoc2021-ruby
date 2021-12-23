# frozen_string_literal: true

DayHelper.day 5 do
  sample <<~INPUT
    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2
  INPUT

  part 1 do
    with_sample_input 5
    with_puzzle_input 5608
  end
end
