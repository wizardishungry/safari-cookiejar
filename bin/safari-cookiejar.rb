#!/usr/bin/env ruby


class SafariCookiejar
    def usage
        puts "#{$0} [curl|wget] arguments";
    end
    def initialize(argv)
        @argv = argv
    end
    def run
    end
end

jar = SafariCookiejar.new ARGV

if ARGV.empty?
    jar.usage
else
    jar.run
end
