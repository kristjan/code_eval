#!/usr/bin/env ruby

def build_graph(sequence)
  {}.tap do |graph|
    sequence.each_cons(2) do |i, j|
      graph[i] = j
    end
  end
end

def build_cycle_from(graph, n)
  [n].tap do |cycle|
    cycle << graph[cycle.last] until graph[cycle.last] == cycle.first
  end
end

def gather_cycle(sequence, graph, n)
  cycle = build_cycle_from(graph, n)
  leftmost = sequence.find{|i| cycle.include?(i)}
  build_cycle_from(graph, leftmost)
end

def detect_cycle(sequence)
  graph = build_graph(sequence)
  sluggish, speedy = sequence[0], sequence[1]
  until speedy.nil?
    return gather_cycle(sequence, graph, speedy) if speedy == sluggish
    sluggish = graph[sluggish]
    speedy = graph[graph[speedy]]
  end
  nil
end

File.readlines(ARGV[0]).each do |line|
  cycle = detect_cycle(line.split(" ").map(&:to_i))
  puts cycle.join(' ') unless cycle.nil?
end
