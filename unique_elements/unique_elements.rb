#!/usr/bin/env ruby

def interesting_uniqify(numbers)
  uniques = []
  last = nil
  numbers.each do |n|
    unless n == last
      uniques << n
      last = n
    end
  end
  uniques
end

def simple_uniqify(numbers)
  numbers.uniq.sort
end

File.readlines(ARGV[0]).each do |line|
  numbers = line.strip.split(',')
  uniques = interesting_uniqify(numbers)
  puts uniques.join(',')
end
