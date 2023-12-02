def parse_game_id(line)
  match_data = line.match(/Game (\d+):/)
  match_data.captures.first
end

def valid_line?(line)
  valid_color?(line, 'red', 12) && valid_color?(line, 'green', 13) && valid_color?(line, 'blue', 14)
end

def valid_color?(line, color, max)
  match_data = line.scan(/(\d+) #{color}/)
  match_data.each do | a |
    amount = a.first
    return false if amount.to_i > max
  end
  true
end

total_sum = 0
File.readlines("puzzle_input.txt", chomp: true).each do | line |
  game_id = parse_game_id(line)
  total_sum += game_id.to_i if valid_line?(line)
end

puts total_sum