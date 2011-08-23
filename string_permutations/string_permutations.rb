#!/usr/bin/env ruby

def string_permutations(str)
  return [''] if str.empty?
  [].tap do |result|
    str.chars.each_with_index do |ch, i|
      rest = string_permutations(str[0...i] + str[i+1..-1])
      rest.each{|s| result << ch + s}
    end
  end
end

File.readlines(ARGV[0]).each do |line|
  line.strip!
  next if line.empty?
  puts string_permutations(line).sort.join(',')
end
