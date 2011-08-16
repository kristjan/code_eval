#!/usr/bin/env ruby

require 'set'

class Fixnum
  def digits
    self.to_s.split('').map(&:to_i)
  end

  def happy?
    seen = Set.new
    n = self
    while true
      return true if n == 1
      return false if seen.include?(n)
      seen << n
      squares = n.digits.map{|d| d * d}
      n = squares.inject(:+)
    end
  end
end

File.readlines(ARGV[0]).each do |line|
  puts line.to_i.happy? ? 1 : 0
end
