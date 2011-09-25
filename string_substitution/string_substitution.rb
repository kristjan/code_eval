#!/usr/bin/env ruby

class String
  def substitute(substitutions)
    self.stunt_double.tap do |s|
      substitutions.each do |original, replacement|
        s.gsub!(original.stunt_double, replacement.stunt_double(true))
      end
    end.real_deal
  end

  def stunt_double(capital=false)
    self.tr('01', (capital ? 'AB' : 'ab'))
  end

  def real_deal
    self.tr('ab', '01').tr('AB', '01')
  end
end

def gather_substitutions(input)
  input = input.split(',')
  [].tap do |substitutions|
    substitutions << input.shift(2) until input.empty?
  end
end

File.readlines(ARGV[0]).each do |line|
  string, rest = line.strip.split(';')
  substitutions = gather_substitutions(rest)
  puts string.substitute(substitutions)
end
