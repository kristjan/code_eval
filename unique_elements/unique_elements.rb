#!/usr/bin/env ruby

def uniqify(numbers)
  numbers.uniq.sort
end

File.readlines(ARGV[0]).each do |line|
  numbers = line.strip.split(',')
  unique = uniqify(numbers)
  puts unique.join(',')
end
