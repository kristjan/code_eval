#!/usr/bin/env ruby

class Fixnum
  def digits
    self.to_s.split('').map(&:to_i)
  end

  def digit_histogram
    @digit_histogram ||= Hash.new(0).tap do |histogram|
      digits.each {|d| histogram[d] += 1}
    end
  end

  def self_describing?
    digits.each_with_index do |digit, i|
      return false unless digit_histogram[i] == digit
    end
    return true
  end
end

File.readlines(ARGV[0]).each do |line|
  puts line.to_i.self_describing? ? 1 : 0
end

