#!/usr/bin/env ruby

def jolly_jumper?(seq)
  diffs = []
  seq.each_cons(2) {|i, j| diffs << (i - j).abs}
  diffs.sort == (1...seq.size).to_a
end

File.readlines(ARGV[0]).each do |line|
  jolly = jolly_jumper?(line.split(' ')[1..-1].map(&:to_i))
  puts jolly ? 'Jolly' : 'Not jolly'
end
