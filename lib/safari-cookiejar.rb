require 'rubygems'
require 'plist'
require 'tempfile'

class SafariCookiejar
    VERSION = '0.0.1'
    def initialize
        reload
    end

    def reload
        result = Plist::parse_xml File.expand_path "~/Library/Cookies/Cookies.plist"
        @tmp_file = Tempfile.new(self.class.name)
        result.each {|r| @tmp_file.write("#{r["Domain"]}\tTRUE\t#{r["Path"]}\tFALSE\t#{r["Expires"].strftime("%s")}\t#{r["Name"]}\t#{r["Value"]}\n")}
    end

    def run (args)
        args.unshift(prog=args.shift, case prog
            when /wget[^\/]*$/
                "--load-cookies"
            when /curl[^\/]*$/
                "--cookie"
            else
                return nil
        end,
        @tmp_file.path)
        
        Kernel.system *args
    end
end

