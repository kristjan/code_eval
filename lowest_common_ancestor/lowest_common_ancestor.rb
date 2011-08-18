#!/usr/bin/env ruby

class Tree
  attr_accessor :value, :left, :right, :parent

  def initialize(value, left=nil, right=nil)
    @value, @left, @right = value, left, right
    [@left, @right].each {|node| node.parent = self if node}
  end

  def ancestors
    return [] unless @parent
    return [@parent] + @parent.ancestors
  end

  def find(value)
    case
    when value == @value
      self
    when @left && value < @value
      @left.find(value)
    when @right && value > @value
      @right.find(value)
    end
  end

  def to_s
    str = @value.to_s
    str += " " + (@left  || '-').to_s
    str += " " + (@right || '-').to_s
    str
  end
end

TREE = Tree.new(30,
         Tree.new(8,
           Tree.new(3),
           Tree.new(20,
             Tree.new(10),
             Tree.new(29))),
         Tree.new(52))

def lowest_common_ancestor(a, b)
  return unless a && b
  node_a, node_b = TREE.find(a), TREE.find(b)
  return unless node_a && node_b
  ancestor = (node_a.ancestors & node_b.ancestors).first
  return ancestor.value if ancestor
end

File.readlines(ARGV[0]).each do |line|
  a, b = line.split(' ').compact.map(&:to_i)
  lowest = lowest_common_ancestor(a, b)
  puts lowest if lowest
end
