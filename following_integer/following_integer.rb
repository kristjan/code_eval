#!/usr/bin/env ruby

class Fixnum
  def permutations
    @permutations ||= begin
      to_s.chars.to_a.permutation.map do |p|
        p.join.to_i unless p.first == '0'
      end.compact.uniq.sort
    end
  end

  def following
    (permutations[permutations.index(self) + 1] ||
     permutations.first.to_s.insert(1, '0')).to_i
  end
end

File.readlines(ARGV[0]).each do |line|
  puts line.to_i.following
end
