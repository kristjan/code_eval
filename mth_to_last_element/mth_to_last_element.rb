#!/usr/bin/env ruby

File.readlines(ARGV[0]).each do |line|
  items = line.split(' ')
  m = items.pop.to_i
  puts items[-m] if items[-m]
end
