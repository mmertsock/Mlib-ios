Pod::Spec.new do |s|
  s.name         = "Mlib-iOS"
  s.version      = "0.1.1"
  s.source       = { :git => "https://github.com/mmertsock/Mlib-ios.git", :tag => "v#{s.version}" }
  s.summary      = "Basic utility code for iOS projects."
  s.homepage     = "https://github.com/mmertsock/Mlib-iOS"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = "mmertsock"
  s.source_files = 'Mlib-iOS'
  s.requires_arc = true
  s.platform     = :ios
end
