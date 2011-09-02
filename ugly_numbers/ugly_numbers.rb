#!/usr/bin/env ruby

class Integer
  UGLY_PRIMES = [2, 3, 5, 7]

  def ugly?
    UGLY_PRIMES.any?{|p| self % p == 0}
  end
end

def expressions(digits)
  return [digits] if digits.length == 1
  current, rest = digits.first, digits[1..-1]
  [].tap do |result|
    expressions(rest).each do |expression|
      result << [current, '+'] + expression
      result << [current, '-'] + expression
      expression[0] = current + expression[0]
      result << expression
    end
  end
end

def evaluate(expression)
  result = expression[0].to_i
  i = 1
  while i < expression.size
    result = result.send(expression[i], expression[i+1].to_i)
    i += 2
  end
  result
end

def ugly_numbers(digits)
  expressions(digits.split('')).count do |expression|
    evaluate(expression).ugly?
  end
end

File.readlines(ARGV[0]).each do |line|
  puts ugly_numbers(line.strip)
end
