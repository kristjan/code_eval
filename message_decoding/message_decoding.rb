#!/usr/bin/env ruby

module Message
  class << self
    def decode(str)
      header, message = $1, $2 if str =~ /^([^01]+)([01]+)$/
      dict = dictionary(header)
      bits = message.split('')
      "".tap do |result|
        segment_length = get_segement_length(bits)
        while segment_length > 0
          terminator = '1' * segment_length
          key = get_encoded_character(bits, segment_length)
          while key != terminator
            result << dict[key]
            key = get_encoded_character(bits, segment_length)
          end
          segment_length = get_segement_length(bits)
        end
      end
    end

    def dictionary(header)
      {}.tap do |dict|
        segment_length = 1
        key = 0
        header.chars.each do |ch|
          dict[key.to_s(2).rjust(segment_length, '0')] = ch
          key += 1
          if key == 2**segment_length - 1
            segment_length += 1
            key = 0
          end
        end
      end
    end

    private

    def get_encoded_character(bits, segment_length)
      bits.shift(segment_length).join
    end

    def get_segement_length(bits)
      bits.shift(3).join.to_i(2)
    end
  end
end

File.readlines(ARGV[0]).each do |line|
  puts Message.decode(line.strip)
end
