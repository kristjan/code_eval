#!/usr/bin/env ruby

require 'set'

def string_list(alphabet, length)
  strings = Set.new
  if length == 0
    strings << ''
    return strings
  end
  alphabet.chars.each do |ch|
    suffixes = string_list(alphabet, length - 1)
    strings += suffixes.map{|s| ch + s}
  end
  strings
end

File.readlines(ARGV[0]).each do |line|
  length, alphabet = line.strip.split(',')
  length = length.to_i
  alphabet = alphabet.chars.to_a.uniq.join
  puts string_list(alphabet, length).sort.join(',')
end
