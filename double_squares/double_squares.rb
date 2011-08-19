#!/usr/bin/env ruby

SQUARES = [0] + 1.upto(Math.sqrt(2**31 - 1).floor).map{|n| n**2}

def double_squares(x)
  [].tap do |solutions|
    left, right = 0, SQUARES.size - 1
    while left <= right
      sum = SQUARES[left] + SQUARES[right]
      case
      when sum == x
        solutions << [SQUARES[left], SQUARES[right]]
        left += 1
        right -= 1
      when sum < x
        left += 1
      when sum > x
        right -= 1
      end
    end
  end
end

File.readlines(ARGV[0])[1..-1].each do |line|
  puts double_squares(line.to_i).size
end
