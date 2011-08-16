#!/usr/bin/env ruby

def interesting_intersect(a, b)
  (a ||= []).tap(&:uniq!).sort!
  (b ||= []).tap(&:uniq!).sort!
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
  ((a || []) & (b || [])).sort
end

def randarr
  1.upto(rand(100)).map{rand(50)}
end

if ARGV[0] == 'autotest'
  1000.times do
    a, b = randarr, randarr
    si = simple_intersect(a, b)
    ii = interesting_intersect(a, b)
    unless si == ii
      puts 'FAIL',
           a.inspect, b.inspect,
           si.inspect, ii.inspect,
           (si - ii).inspect, (ii - si).inspect,
           ''
    end
  end
else
  File.readlines(ARGV[0]).each do |line|
    a, b = line.strip.split(';').map{|s| s.split(',')}
    puts interesting_intersect(a, b).join(',')
  end
end
