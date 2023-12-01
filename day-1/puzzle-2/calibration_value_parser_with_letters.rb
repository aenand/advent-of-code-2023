def map_words_to_digits(line)
  letter_mapping = {
    'three' => 't3e',
    'seven' => 's7n',
    'eight' => 'e8t',
    'nine' => 'n9e',
    'four' => 'f4r',
    'five' => 'f5e',
    'two' => 't2o',
    'six' => 's6x',
    'one' => 'o1e'
  }

  letter_mapping.each do |key, digit|
    # Issue: Is going based on hash map ordering, not string ordering
    # Solution: Add digit as middle value so that beginning and last char can still catch other words
    if line.include? key
      line.gsub! key, digit.to_s
    end
  end
  line
end

# Read the file
file_data = File.read("puzzle_input.txt").split
total_sum = 0
# Iterate through lines
file_data.each do | line |
  new_line = map_words_to_digits(line)
  # Hold values in array to join
  digits = []
  # Find first digit with regex
  digits << new_line[/\d/]
  # Reverse string and find first digit with regex
  digits << new_line.reverse[/\d/]
  # Join array to combine 2 digits into one (without adding)
  total_sum += digits.join.to_i
end
puts total_sum