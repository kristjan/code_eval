#!/usr/bin/env ruby

class Fixnum
  def palindrome?
    to_s.palindrome?
  end

  def reverse
    to_s.reverse.to_i
  end
end

class String
  def palindrome?
    return true if empty?
    return false unless self[0] == self[-1]
    self[1...-1].palindrome?
  end
end

def reverse_and_add(n)
  iterations = 0
  until n.palindrome?
    n += n.reverse
    iterations += 1
  end
  [iterations, n]
end

File.readlines(ARGV[0]).each do |line|
  iterations, result = reverse_and_add(line.to_i)
  puts [iterations, result].join(' ')
end
