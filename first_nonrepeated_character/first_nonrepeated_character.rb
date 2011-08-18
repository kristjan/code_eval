#!/usr/bin/env ruby

def histogram(items)
  Hash.new(0).tap do |histogram|
    items.each {|i| histogram[i] += 1}
  end
end

def first_nonrepeated_character(str)
  chars = str.split('')
  hist = histogram(chars)
  chars.find {|ch| hist[ch] == 1}
end

File.readlines(ARGV[0]).each do |line|
  result = first_nonrepeated_character(line)
  puts result if result
end
