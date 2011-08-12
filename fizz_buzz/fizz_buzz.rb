#!/usr/bin/env ruby

def fizz_buzz(a, b, n)
  1.upto(n).map do |i|
    i % a == 0 ?
      i % b == 0 ? 'FB' : 'F' :
      i % b == 0 ? 'B'  : i
  end.join(' ')
end

File.readlines(ARGV[0]).each do |line|
  a, b, n = line.split(' ').map(&:to_i)
  puts fizz_buzz(a, b, n)
end
