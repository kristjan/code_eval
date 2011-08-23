#!/usr/bin/env ruby

def longest_common_subsequence(a, b)
  return '' if a.empty? || b.empty?
  if a[0] == b[0]
    a[0] + longest_common_subsequence(a[1..-1], b[1..-1])
  else
    drop_a = longest_common_subsequence(a[1..-1], b)
    drop_b = longest_common_subsequence(a, b[1..-1])
    [drop_a, drop_b].sort_by(&:length).last
  end
end

File.readlines(ARGV[0]).each do |line|
  a, b = line.split(';')
  puts longest_common_subsequence(a, b)
end
