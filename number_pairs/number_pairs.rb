#!/usr/bin/env ruby

def number_pairs(values, target)
  [].tap do |solutions|
    left, right = 0, values.size - 1
    while left < right
      sum = values[left] + values[right]
      case
      when sum == target
        solutions << [values[left], values[right]]
        left += 1
        right -= 1
      when sum < target
        left += 1
      when sum > target
        right -= 1
      end
    end
  end.sort
end

File.readlines(ARGV[0]).each do |line|
  values, target = line.split(';')
  values = values.split(',').map(&:to_i)
  target = target.to_i
  result = number_pairs(values, target)
  puts result.any? ? result.map{|pair| pair.join(',')}.join(';') : 'NULL'
end
