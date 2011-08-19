#!/usr/bin/env ruby

def sum_of_integers(arr)
  (0...arr.size).map do |i|
    ((i + 1)...arr.size).map do |j|
      arr[i..j].inject(:+)
    end
  end.flatten.max
end

File.readlines(ARGV[0]).each do |line|
  arr = line.split(',').map(&:to_i)
  result = sum_of_integers(arr)
  puts result if result
end
