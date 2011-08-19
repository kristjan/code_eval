#!/usr/bin/env ruby

def endianness
  [1,0,0,0].pack('i') == "\x01\x00\x00\x00" ?
    'LittleEndian' : 'BigEndian'
end

puts endianness
