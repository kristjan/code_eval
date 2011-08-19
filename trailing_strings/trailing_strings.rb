#!/usr/bin/env ruby

class String
  def ends_with?(ending)
    self =~ /#{ending}$/
  end
end

File.readlines(ARGV[0]).each do |line|
  string, ending = line.strip.split(',')
  puts string.ends_with?(ending) ? 1 : 0
end
