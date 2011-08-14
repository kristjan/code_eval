#!/usr/bin/env ruby

def sum_digits(str)
  str.chars.map(&:to_i).inject(:+)
end

File.readlines(ARGV[0]).each do |line|
  puts sum_digits(line)
end
