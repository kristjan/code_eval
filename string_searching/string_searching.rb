#!/usr/bin/env ruby

class String
  def substring?(needle, i=0)
    return true if needle.length - 1 == i
    return false if self.empty?

    rest = self[1..-1]

    if needle[i..i+1] == '\*'
      return true if self[0] == '*' && rest.substring?(needle, i+2)
    end

    if needle[i] == '*'
      return true if rest.substring?(needle, i) || substring?(needle, i+1)
    end

    if self[0] == needle[i]
      return true if rest.substring?(needle, i+1)
    end

    return rest.substring?(needle)
  end
end

File.readlines(ARGV[0]).each do |line|
  haystack, needle = line.strip.split(',')
  puts haystack.substring?(needle)
end
