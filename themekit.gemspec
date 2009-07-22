spec = Gem::Specification.new do |s| 
  s.name = "themekit" 
  s.summary = "A tiny app that makes designing Yardstick Measure themes a whole lot more enjoyable."
  s.version = "0.0.2" 
  s.author = "Yardstick Software" 
  s.email = "kyle@yardsticksoftware.com" 
  s.homepage = "https://github.com/yardstick/Yardstick-ThemeKit/tree/master"
  s.platform = Gem::Platform::RUBY 
  s.files = Dir['**/**'] 
  s.executables = ['themekit'] 
  s.has_rdoc = false  
  s.add_dependency "sinatra"
end 

