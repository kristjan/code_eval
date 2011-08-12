#!/usr/bin/env ruby

class Fixnum
  def prime?
    return false if self < 2
    2.upto(Math.sqrt(self)) do |i|
      return false if self % i == 0
    end
    return true
  end

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

1000.downto(0) do |i|
  if i.palindrome? && i.prime?
    puts i
    exit
  end
end
