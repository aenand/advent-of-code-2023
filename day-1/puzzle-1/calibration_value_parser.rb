# Read the file
file_data = File.read("puzzle_input.txt").split
total_sum = 0
# Iterate through lines
file_data.each do | line |
  # Hold values in array to join
  digits = []
  # Find first digit with regex
  digits << line[/\d/]
  # Reverse string and find first digit with regex
  digits << line.reverse[/\d/]
  # Join array to combine 2 digits into one (without adding)
  total_sum += digits.join.to_i
end
puts total_sum