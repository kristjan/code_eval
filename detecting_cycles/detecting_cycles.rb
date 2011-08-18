#!/usr/bin/env ruby

module Simple
  class << self
    def detect_cycle(sequence)
      locations = {}
      sequence.each_with_index do |n, i|
        if locations[n]
          return sequence[locations[n]...i]
        else
          locations[n] = i
        end
      end
      nil
    end
  end
end

module TortiseAndHare
  class << self
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
      tortise, hare = sequence[0], sequence[1]
      until hare.nil?
        return gather_cycle(sequence, graph, hare) if hare == tortise
        tortise = graph[tortise]
        hare = graph[graph[hare]]
      end
      nil
    end
  end
end

File.readlines(ARGV[0]).each do |line|
  cycle = Simple.detect_cycle(line.split(" ").map(&:to_i))
  puts cycle.join(' ') unless cycle.nil?
end
