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

def c(e);(i=e.shift)=~/\d/?i.to_i: c(e).send(i,c(e));end

File.readlines(ARGV[0]).each do |line|
  line.strip!
  next if line.empty?
  result = c(line.split(' '))
  puts result if result
end
