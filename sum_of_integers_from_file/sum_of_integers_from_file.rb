#!/usr/bin/env ruby

puts File.readlines(ARGV[0]).map(&:to_i).inject(:+)
