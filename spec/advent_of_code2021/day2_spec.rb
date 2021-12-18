# frozen_string_literal: true

DayHelper.day 2 do
  sample <<~INPUT
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
  INPUT

  part 1 do
    with_sample_input 150
    with_puzzle_input 1_484_118
  end

  part 2 do
    with_sample_input 900
    with_puzzle_input 1_463_827_010
  end
end
