require 'rake/gempackagetask' 

spec = Gem::Specification.new do |s| 
  s.name = "themekit" 
  s.summary = "Ease the pain of creating Yardstick Themes" 
  s.description= File.read(File.join(File.dirname(__FILE__), 'README.md')) 
  s.version = "0.0.1" 
  s.author = "Yardstick Software" 
  s.email = "kyle@yardsticksoftware.com" 
  s.homepage = "https://github.com/yardstick/Yardstick-ThemeKit/tree/master"
  s.platform = Gem::Platform::RUBY 
  s.files = Dir['**/**'] 
  s.executables = ['themekit'] 
  s.has_rdoc = false  
  s.add_dependency "sinatra"
end 

Rake::GemPackageTask.new(spec).define 