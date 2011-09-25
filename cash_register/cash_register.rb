#!/usr/bin/env ruby

DENOMINATIONS = [
  [100.00, 'ONE HUNDRED'],
  [50.00 , 'FIFTY'],
  [20.00 , 'TWENTY'],
  [10.00 , 'TEN'],
  [5.00  , 'FIVE'],
  [2.00  , 'TWO'],
  [1.00  , 'ONE'],
  [0.50  , 'HALF DOLLAR'],
  [0.25  , 'QUARTER'],
  [0.10  , 'DIME'],
  [0.05  , 'NICKEL'],
  [0.01  , 'PENNY'],
].map{|value, name| [value * 100, name]}

def get_change(price, tendered)
  price, tendered = [price, tendered].map{|m| (m * 100).to_i}
  difference = tendered - price

  return 'ERROR' if difference < 0
  return 'ZERO' if difference == 0

  [].tap do |change|
    while difference > 0
      largest, name = DENOMINATIONS.find {|(value, name)| value <= difference }
      difference -= largest
      change << name
    end
  end.sort.join(',')
end

File.readlines(ARGV[0]).each do |line|
  price, tendered = line.split(';').map(&:to_f)
  puts get_change(price, tendered)
end
