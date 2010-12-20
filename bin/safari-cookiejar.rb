#!/usr/bin/env ruby

require './lib/safari-cookiejar'
require 'rubygems'


if ARGV.empty?
    puts "#{$0} [curl|wget] arguments";
else
    jar = SafariCookiejar.new
    jar.run(ARGV)
end
