file_data = File.readlines("puzzle_input.txt", chomp: true)
total = 0
copies = Array.new(file_data.length+1, 0)
file_data.each_with_index do | line, index|
  card_num = index + 1
  copies[card_num] += 1
  numbers = line.split(": ")[1].split(" | ")
  winning_numbers = numbers.first.split.map(&:to_i)
  owned_numbers = numbers.last.split.map(&:to_i)
  points = 0
  count_wins = 0
  owned_numbers.each do | num |
    next unless winning_numbers.include?(num)
    if points == 0
      points = 1
    else
      points = points * 2
    end
    count_wins += 1
  end
  
  if count_wins > 0
    # If we won, then iterate through the winning cards
    for x in (card_num+1)..(card_num + count_wins) do
      # Going to run card x at least the amount of times the current card row is running, so add the number of times we have run this row
      copies[x] += 1*copies[card_num]
    end
  end
  total += points
end

puts copies.sum