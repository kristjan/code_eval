#!/usr/bin/env ruby

def size_grid(a, b)
  sizes = 0.upto(a.length).map{Array.new()}
  0.upto(a.length) {|ai| sizes[ai][b.length] = 0}
  0.upto(b.length) {|bi| sizes[a.length][bi] = 0}

  (a.length - 1).downto(0) do |ai|
    (b.length - 1).downto(0) do |bi|
      if a[ai] == b[bi]
        sizes[ai][bi] = 1 + sizes[ai + 1][bi + 1]
      else
        sizes[ai][bi] = [sizes[ai + 1][bi], sizes[ai][bi + 1]].max
      end
    end
  end
  sizes
end

def longest_common_subsequence(a, b)
  sizes = size_grid(a, b)
  lcs = ''
  ai = bi = 0
  while ai < a.length && bi < b.length
    if a[ai] == b[bi]
      lcs << a[ai]
      ai += 1
      bi += 1
    elsif sizes[ai + 1][bi] > sizes[ai][bi + 1]
      ai += 1
    else
      bi += 1
    end
  end
  lcs
end

File.readlines(ARGV[0]).each do |line|
  next if line.empty?
  a, b = line.split(';')
  puts longest_common_subsequence(a || '', b || '')
end
