require 'pry'
file_data = File.readlines("puzzle_input.txt", chomp: true)

elements = {}
current = ''

for x in 2..file_data.length-1 do
  line = file_data[x]
  key = line.split(' =').first
  current << key + ', 'if key.end_with?('A')
  value = line.split(' (').last.gsub(')', '')
  elements[key] = value
end

current = current.chomp(', ').split(', ')

puts current.join(', ')

directions = file_data.first
results = []

current.each do | c |
  found = false
  count_moves = 0
  while !found do
    step = directions[count_moves % directions.length]
    options = elements[c]
    if step == 'R'
      c = options.split(', ').last
    else
      c = options.split(', ').first
    end
    found = true if c.end_with?('Z')
    count_moves += 1
  end
  results << count_moves
end

puts results.reduce(1, :lcm)