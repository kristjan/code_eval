#!/usr/bin/env ruby

class Fixnum
  def to_binary
    case self
    when 0
      '0'
    when 1
      '1'
    else
      (self >> 1).to_binary + (self.odd? ? '1' : '0')
    end
  end
end

File.readlines(ARGV[0]).each do |line|
  puts line.to_i.to_binary
end
