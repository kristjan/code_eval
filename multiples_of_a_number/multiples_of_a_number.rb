#!/usr/bin/env ruby

def smallest_multiple(x, n)
  multiple = n
  multiple += n while multiple < x
  multiple
end

File.readlines(ARGV[0]).each do |line|
  x, n = line.split(',').map(&:to_i)
  puts smallest_multiple(x, n)
end
