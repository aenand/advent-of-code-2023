file_data = File.readlines("puzzle_input.txt", chomp: true)
total = 0
file_data.each do | line |
  numbers = line.split(": ")[1].split(" | ")
  winning_numbers = numbers.first.split.map(&:to_i)
  owned_numbers = numbers.last.split.map(&:to_i)
  points = 0
  owned_numbers.each do | num |
    next unless winning_numbers.include?(num)
    if points == 0
      points = 1
    else
      points = points * 2
    end
  end
  total += points
end

puts total