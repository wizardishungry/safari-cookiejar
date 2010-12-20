require 'rubygems'
require 'plist'
class SafariCookiejar
    def usage
        puts "#{$0} [curl|wget] arguments";
    end

    def initialize
        reload
    end

    def reload
        result = Plist::parse_xml File.expand_path "~/Library/Cookies/Cookies.plist"
    end

    def run (argv)
    end
end

