#!/usr/bin/env ruby

class Range
  def size
    max - min + 1
  end
end

class Fixnum
  def palindrome?
    to_s.palindrome?
  end
end

class String
  def palindrome?
    return true if empty?
    return false unless self[0] == self[-1]
    self[1...-1].palindrome?
  end
end

def number_of_interesting_ranges(range)
  palindromes = range.map(&:palindrome?)
  palindrome_counts = Array.new(range.size) { Array.new }
  range.each do |left|
    left_index = left - range.min
    palindrome_counts[left_index][0] = palindromes[left_index] ? 1 : 0
    (left+1..range.max).each do |right|
      right_index = right - left
      palindrome_counts[left_index][right_index] =
        palindrome_counts[left_index][right_index-1] +
        (palindromes[right - range.min] ? 1 : 0)
    end
  end
  palindrome_counts.flatten.compact.count(&:even?)
end

File.readlines(ARGV[0]).each do |line|
  bounds = line.split(' ').map(&:to_i)
  range = bounds[0]..bounds[1]
  puts number_of_interesting_ranges(range)
end
