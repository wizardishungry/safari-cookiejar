#!/usr/bin/env ruby

require './lib/safari-cookiejar'

#require('rubygems')

jar = SafariCookiejar.new

if ARGV.empty?
    jar.usage
else
    jar.run(ARGV)
end
