#!/usr/bin/env ruby

MAX_DISTANCE = 10000

class Point
  attr_accessor :x, :y

  def initialize(line)
    @x, @y = line.strip.split(' ').map(&:to_i)
  end

  def distance_to(other)
    Math.sqrt((other.y - @y)**2 + (other.x - @x)**2)
  end
end

class PointSet
  def self.read(lines)
    size = lines.shift.to_i
    new(lines.shift(size))
  end

  def initialize(lines)
    @points = lines.map{|line| Point.new(line)}
  end

  def empty?
    @points.empty?
  end

  def shortest_distance
    min = MAX_DISTANCE + 1
    @points.each_with_index do |point_a, i|
      @points[i+1..-1].each do |point_b|
        distance = point_a.distance_to(point_b)
        min = distance if distance < min
      end
    end
    min
  end
end

lines = File.readlines(ARGV[0])
loop do
  set = PointSet.read(lines)
  break if set.empty?
  distance = set.shortest_distance
  puts distance > MAX_DISTANCE ? 'INFINITY' : "%.4f" % distance
end
