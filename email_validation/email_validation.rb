#!/usr/bin/env ruby

class String
  INITIAL  = "[a-z0-9!\#$%&'*+/=?^_`{|}~-]+"
  USERNAME = "(?:\\.[a-z0-9!\#$%&'*+/=?^_`{|}~-]+)"
  DOMAIN   = "(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z]+\\b"

  EMAIL = /^#{INITIAL}#{USERNAME}*@#{DOMAIN}$/i

  def email?
    !!(self =~ EMAIL)
  end
end

File.readlines(ARGV[0]).each do |line|
  puts line.email?
end
