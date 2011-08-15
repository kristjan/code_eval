#!/usr/bin/env ruby

def interesting_intersect(a, b)
  intersection = []
  i = j = 0
  while i < a.size && j < b.size
    if a[i] == b[j]
      intersection << a[i]
      i += 1
      j += 1
    elsif a[i] < b[j]
      i += 1
    else
      j += 1
    end
  end
  intersection
end

def simple_intersect(a, b)
  a & b
end

File.readlines(ARGV[0]).each do |line|
  a, b = line.strip.split(';').map{|s| s.split(',')}
  puts interesting_intersect(a, b).join(',')
end
