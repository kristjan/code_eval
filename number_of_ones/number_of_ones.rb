#!/usr/bin/env ruby

def number_of_ones(num)
  bits = 0
  while num > 0
    num &= (num-1)
    bits += 1
  end
  bits
end

File.readlines(ARGV[0]).each do |line|
  result = number_of_ones(line.to_i)
  puts result if result
end
