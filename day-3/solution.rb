def symbol?(string)
  string.match?(/[^.\d]/)
end

file_data = File.read("puzzle_input.txt").split
total = 0

# Iterate through file
file_data.each_with_index do | line, row |
  # Find numbers
  line.scan(/\d+/) do | value |
    found = false
    left_bound = $~.offset(0)[0] - 1
    right_bound = $~.offset(0)[0] + value.size
    left_bound = 0 if left_bound < 0
    right_bound = line.length-1 if right_bound >= line.length
    # check left and right
    found = symbol?(line[left_bound..right_bound])
    total += value.to_i if found
    next if found
    # check above
    found = symbol?(file_data[row-1][left_bound..right_bound]) if file_data[row-1]
    total += value.to_i if found
    next if found
    # check below
    found = symbol?(file_data[row+1][left_bound..right_bound]) if file_data[row+1]
    total += value.to_i if found
    next if found
  end
end

puts total