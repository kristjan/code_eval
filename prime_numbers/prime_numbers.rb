#!/usr/bin/env ruby

class Fixnum
  @@primes = [2]

  def prime?
    return false if self == 1
    sqrt = Math.sqrt(self)
    @@primes.each do |prime|
      return true if prime == self
      break if prime > sqrt
      return false if self % prime == 0
    end
    @@primes << self
    true
  end
end

def prime_numbers_until(n)
  (1...n).select(&:prime?)
end

File.readlines(ARGV[0]).each do |line|
  puts prime_numbers_until(line.to_i).join(',')
end
