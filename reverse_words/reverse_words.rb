#!/usr/bin/env ruby

def reverse_words(sentence)
  sentence.split(' ').reverse.join(' ')
end

puts File.readlines(ARGV[0]).map {|line| reverse_words(line)}
