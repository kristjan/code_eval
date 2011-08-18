#!/usr/bin/env ruby

class Stack
  class Node
    attr_accessor :next
    attr_reader :value

    def initialize(value)
      @next = nil
      @value = value
    end
  end

  def initialize
    @head = nil
  end

  def empty?
    @head.nil?
  end

  def pop
    unless empty?
      node = @head
      @head = node.next
      node.value
    end
  end

  def push(value)
    node = Node.new(value)
    @head, node.next = node, @head
    value
  end
end

def every_other_backwards(items)
  stack = Stack.new
  items.each{|i| stack.push(i)}
  result = []
  until stack.empty?
    result << stack.pop
    stack.pop
  end
  result.join(' ')
end

File.readlines(ARGV[0]).each do |line|
  puts every_other_backwards(line.strip.split(' ').map(&:to_i))
end
