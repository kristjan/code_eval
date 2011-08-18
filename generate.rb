#!/usr/bin/env ruby

require 'fileutils'

name = ARGV[0]
unless name
  puts "Usage: #{__FILE__} <puzzle_name>"
  exit 1
end

if File.exist?(name)
  puts "<#{name}> already exists"
  exit 1
end

FileUtils.mkdir(name)
template = File.read('template.rb')
File.open("#{name}/#{name}.rb", 'w') do |f|
  f.write(template.gsub('solve', name))
end
FileUtils.touch("#{name}/input")

