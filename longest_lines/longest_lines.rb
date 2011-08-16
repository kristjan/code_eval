#!/usr/bin/env ruby

def simple_longest_n(lines, count)
  lines.sort_by(&:length).last(count).reject(&:empty?).reverse
end

def interesting_longest_n(lines, count)
  return [] if count == 0

  longest = []

  until lines.empty? do
    candidate = lines.shift.strip
    next if candidate.empty?
    next unless longest.size < count || candidate.length > longest.first.length
    index = longest.index{|long| long.size > candidate.size} || longest.size
    longest.insert(index, candidate)
    longest.shift if longest.size > count
  end

  longest.reverse
end

lines = File.readlines(ARGV[0])
count = lines.shift.to_i
puts interesting_longest_n(lines, count)
