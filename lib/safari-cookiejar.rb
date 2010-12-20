require 'rubygems'
require 'plist'
require 'tempfile'

class SafariCookiejar
    def initialize
        reload
    end

    def reload
        result = Plist::parse_xml File.expand_path "~/Library/Cookies/Cookies.plist"
        @tmp_file = Tempfile.new(self.class.name) {|f| result.each {|r| f.write("#{r["Domain"]}\tTRUE\t#{r["Path"]}\tFALSE\t#{r["Expires"].strftime("%s")}\t#{r["Name"]}\t#{r["Value"]}\n")}}
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
        
        puts(args)
        Kernel.system *args
        @tmp_file.close!
    end
end

