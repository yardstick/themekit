# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{themekit}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yardstick Software"]
  s.date = %q{2010-04-15}
  s.default_executable = %q{themekit}
  s.description = %q{A tiny app that makes designing Yardstick Measure themes a whole lot more enjoyable.}
  s.email = %q{kyle@yardsticksoftware.com}
  s.executables = ["themekit"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md",
     "Rakefile",
     "VERSION",
     "bin/screenshots",
     "bin/themekit",
     "bin/webkit2png",
     "example_theme/info.yml",
     "example_theme/styles.css",
     "example_theme/theme.html",
     "github-test.rb",
     "lib/themekit.rb",
     "lib/themekit/data.rb",
     "lib/themekit/server.rb",
     "lib/themekit/theme.rb",
     "themekit-0.1.0.gem",
     "themekit.gemspec"
  ]
  s.homepage = %q{http://github.com/yardstick/themekit}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Enjoyable theming for Yardstick Measure.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sinatra>, [">= 0.9.4"])
    else
      s.add_dependency(%q<sinatra>, [">= 0.9.4"])
    end
  else
    s.add_dependency(%q<sinatra>, [">= 0.9.4"])
  end
end

