#!/usr/bin/env ruby

class Fixnum
  def bits_match?(p1, p2)
    self[p1] == self[p2]
  end
end

File.readlines(ARGV[0]).each do |line|
  n, p1, p2 = line.split(',').map(&:to_i)
  puts n.bits_match?(p1 - 1, p2 - 1)
end
