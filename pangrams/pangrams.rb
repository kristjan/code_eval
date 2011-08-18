#!/usr/bin/env ruby

ALPHABET = ('a'..'z').to_a

def missing_chars(sentence)
  ALPHABET - sentence.downcase.split('')
end

File.readlines(ARGV[0]).each do |line|
  chars = missing_chars(line)
  puts chars.empty? ? 'NULL' : chars.join
end
