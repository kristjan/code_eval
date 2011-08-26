#!/usr/bin/env ruby

class Fixnum
  UGLY_PRIMES = [2, 3, 5, 7]

  def ugly?
    UGLY_PRIMES.any?{|p| self % p == 0}
  end
end

class String
  def remove_leading_zeros!
    sub!(/^0+/, '')
  end
end

def expressions(digits)
  return digits if digits.length == 1
  current, rest = digits.first, digits[1..-1]
  [].tap do |result|
    expressions(rest).each do |expression|
      result << "#{current}#{expression}"
      expression.remove_leading_zeros!
      result << "#{current}+#{expression}"
      result << "#{current}-#{expression}"
    end
  end
end

def ugly_numbers(digits)
  expressions(digits.split('')).count do |expression|
    expression.remove_leading_zeros!
    eval(expression).ugly?
  end
end

File.readlines(ARGV[0]).each do |line|
  puts ugly_numbers(line.strip)
end
