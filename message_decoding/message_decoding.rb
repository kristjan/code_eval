#!/usr/bin/env ruby

module Message
  def self.decode(str)
    header, message = $1, $2 if str =~ /^([^01]+)([01]+)$/
    dict = Dictionary.new(header)
    stream = Stream.new(message)
    "".tap do |result|
      result << dict[stream.next_key] until stream.empty?
    end
  end

private

  class Dictionary
    def initialize(header)
      @header = header
      build
    end

    def [](key)
      @dictionary[key]
    end

  private

    def build
      @dictionary = {}
      segment_length = 1
      key = 0
      @header.chars.each do |ch|
        @dictionary[key.to_s(2).rjust(segment_length, '0')] = ch
        key += 1
        if key == 2**segment_length - 1
          segment_length += 1
          key = 0
        end
      end
    end
  end

  class Stream
    def initialize(message)
      @bits = message.split('')
      @segment_length = next_segment_length
      @pending_key = read
    end

    def empty?
      @bits.empty?
    end

    def next_key
      return if empty?
      key = @pending_key
      @pending_key = read
      if @pending_key == terminator
        @segment_length = next_segment_length
        @pending_key = read unless @segment_length == 0
      end
      key
    end

  private

    def terminator
      '1' * @segment_length
    end

    def next_segment_length
      @bits.shift(3).join.to_i(2)
    end

    def read
      @bits.shift(@segment_length).join
    end
  end

end

File.readlines(ARGV[0]).each do |line|
  puts Message.decode(line.strip)
end
