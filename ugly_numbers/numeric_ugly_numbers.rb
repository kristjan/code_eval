#!/usr/bin/env ruby

class Integer
  UGLY_PRIMES = [3, 5, 7]

  def ugly?
    even? || UGLY_PRIMES.any?{|p| self % p == 0}
  end
end

def count_ugly_numbers(digits, i, total, working)
  count = 0
  if i == digits.length
    if total
      count += 1 if (total + working).ugly?
      count += 1 if (total - working).ugly?
    else
      count += 1 if working.ugly?
    end
    return count
  end

  digit = digits[i]
  if total && working
    count += count_ugly_numbers(digits, i + 1, total, working * 10 + digit)
    count += count_ugly_numbers(digits, i + 1, total + working, digit)
    count += count_ugly_numbers(digits, i + 1, total - working, digit)
  elsif working
    count += count_ugly_numbers(digits, i + 1, nil, working * 10 + digit)
    count += count_ugly_numbers(digits, i + 1, working, digit)
  else
    count += count_ugly_numbers(digits, i + 1, nil, digit)
  end

  return count
end

File.readlines(ARGV[0]).each do |line|
  digits = line.strip.split('').map(&:to_i)
  puts count_ugly_numbers(digits, 0, nil, nil)
end
