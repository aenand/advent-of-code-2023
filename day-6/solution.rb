def calculate_distance(race_time, hold_time)
  moving_time = race_time - hold_time
  velocity = hold_time
  distance_moved = moving_time * velocity
  distance_moved
end

def count_ways_to_beat(race_time, distance)
  total = 0
  for a in 0..race_time do
    total += 1 if calculate_distance(race_time, a) > distance
  end
  total
end

file_data = File.readlines("puzzle_input.txt", chomp: true)
time = file_data.first.split(": ")[1].split.map(&:to_i)
distance = file_data.last.split(": ")[1].split.map(&:to_i)
total_sum = 1

time.each_with_index do | t, index |
  total_sum = total_sum * count_ways_to_beat(t, distance[index])
end

puts total_sum