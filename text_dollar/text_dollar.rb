#!/usr/bin/env ruby

ONES = {
  1 => 'One',
  2 => 'Two',
  3 => 'Three',
  4 => 'Four',
  5 => 'Five',
  6 => 'Six',
  7 => 'Seven',
  8 => 'Eight',
  9 => 'Nine'
}

TEENS = {
  10 => 'Ten',
  11 => 'Eleven',
  12 => 'Twelve',
  13 => 'Thirteen',
  14 => 'Fourteen',
  15 => 'Fifteen',
  16 => 'Sixteen',
  17 => 'Seventeen',
  18 => 'Eighteen',
  19 => 'Nineteen'
}

TENS = {
  20 => 'Twenty',
  30 => 'Thirty',
  40 => 'Forty',
  50 => 'Fifty',
  60 => 'Sixty',
  70 => 'Seventy',
  80 => 'Eighty',
  90 => 'Ninety'
}

MAGNITUDES = ['Million', 'Thousand', '']

def text_dollar(input)
  if input.to_i.zero?
    'Zero'
  else
    triplets(input).map{|t| text_triplet(t)}.
      reverse.zip(MAGNITUDES.reverse).reverse.
      reject{|(text, magnitude)| text.empty?}.
      map(&:join).join
  end + 'Dollars'
end

def text_triplet(triplet)
  triplet.unshift(nil) while triplet.size < 3
  one, ten, hundred = triplet.reverse.map(&:to_i)
  "".tap do |text|
    text << ONES[hundred] + 'Hundred' if hundred > 0
    if ten == 1
      text << TEENS[10*ten + one]
    else
      text << TENS[10*ten] if ten > 0
      text << ONES[one] if one > 0
    end
  end
end

def triplets(input)
  chars = input.chars.to_a
  [].tap do |result|
    result.unshift chars.pop(3) until chars.empty?
  end
end

File.readlines(ARGV[0]).each do |line|
  result = text_dollar(line.strip)
  puts result if result
end
