#!/usr/bin/env ruby

def fibonacci(n)
  a, b = [1, 1]
  a, b = b, a + b while (n -= 1) > 0
  a
end

File.readlines(ARGV[0]).each do |line|
  puts fibonacci(line.to_i)
end
