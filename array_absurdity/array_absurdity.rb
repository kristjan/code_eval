#!/usr/bin/env ruby

def find_duplicate(n, values)
  max_value = n - 2
  expected_total = max_value*(max_value+1)/2
  total = values.inject(:+)
  total - expected_total
end

File.readlines(ARGV[0]).each do |line|
  n, values = line.split(';')
  next unless n && values
  n = n.to_i
  values = values.split(',').map(&:to_i)
  puts find_duplicate(n, values)
end
