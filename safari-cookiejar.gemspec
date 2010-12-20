s = Gem::Specification.new do |s|
  s.name = %q{safari-cookiejar}
  s.version = "0.0.1"
  s.date = %q{2010-12-20}
  s.authors = ["Jon Williams"]
  s.email = %q{jonathan.williams+cookiejar@gmail.com}
  s.summary = %q{Calls curl or wget with a cookies.txt generated from Safari's cookie jar}
  s.homepage = %q{http://github.com/WIZARDISHUNGRY/safari-cookiejar}
  s.description = %q{Calls curl or wget with a cookies.txt generated from Safari's cookie jar.}
  s.files = [ "README.md", "bin/safari-cookiejar" ]
  s.executables = [ "safari-cookiejar" ]
end
s.add_dependency "plist"
