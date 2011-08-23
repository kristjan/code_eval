#!/usr/bin/env ruby

def calculate(expression)
  element = expression.shift
  if element =~ /\d+/
    element.to_i
  else
    operator = element
    left = calculate(expression)
    right = calculate(expression)
    left.send(operator, right)
  end
end

File.readlines(ARGV[0]).each do |line|
  line.strip!
  next if line.empty?
  result = calculate(line.split(' '))
  puts result if result
end
