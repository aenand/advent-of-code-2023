require 'pry'
file_data = File.readlines("puzzle_input.txt", chomp: true)

elements = {}

for x in 2..file_data.length-1 do
  line = file_data[x]
  key = line.split(' =').first
  value = line.split(' (').last.gsub(')', '')
  elements[key] = value
end

directions = file_data.first

current = 'AAA'
found = false
count_moves = 0
while !found do
  step = directions[count_moves % directions.length]
  options = elements[current]
  if step == 'R'
    current = options.split(', ').last
  else
    current = options.split(', ').first
  end
  found = true if current == 'ZZZ'
  count_moves += 1
end
puts count_moves
