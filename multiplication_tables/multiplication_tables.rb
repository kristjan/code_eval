#!/usr/bin/env ruby

def print_multiples(n, max)
  puts (1..max).map {|i| (n * i).to_s.rjust(4)}.join
end

def print_multiplication_table(max)
  1.upto(max) {|i| print_multiples(i, max)}
end

print_multiplication_table(12)
