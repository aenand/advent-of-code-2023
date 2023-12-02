require 'pry'
def parse_line(line)
  minimum_red = minimum_value(line, 'red') 
  minimum_green = minimum_value(line, 'green')
  minimum_blue = minimum_value(line, 'blue')
  minimum_red * minimum_green * minimum_blue
end

def minimum_value(line, color)
  match_data = line.scan(/(\d+) #{color}/)
  minimum_needed = 0
  match_data.each do | a |
    amount = a.first.to_i
    minimum_needed = amount if amount > minimum_needed
  end
  minimum_needed
end

total_sum = 0
File.readlines("puzzle_input.txt", chomp: true).each do | line |
  total_sum += parse_line(line)
end

puts total_sum