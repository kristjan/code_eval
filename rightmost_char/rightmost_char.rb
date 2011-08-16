#!/usr/bin/env ruby

def rightmost_char(str, ch)
  str.rindex(ch) || -1
end

File.readlines(ARGV[0]).each do |line|
  str, ch = line.strip.split(',')
  puts rightmost_char(str, ch) if str && ch
end
