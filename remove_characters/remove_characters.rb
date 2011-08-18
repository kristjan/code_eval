#!/usr/bin/env ruby

File.readlines(ARGV[0]).each do |line|
  str, chars = line.split(',').map(&:strip)
  puts str.gsub(/[#{chars}]/, '')
end
