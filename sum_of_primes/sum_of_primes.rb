#!/usr/bin/env ruby

class Fixnum
  def prime?
    return false if self < 2
    2.upto(Math.sqrt(self)) do |i|
      return false if self % i == 0
    end
    return true
  end
end

primes = []
n = 0
while primes.size < 1000
  primes << n if n.prime?
  n += 1
end

puts primes.inject(0) {|s, i| s+i}
