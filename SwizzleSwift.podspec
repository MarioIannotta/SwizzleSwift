Pod::Spec.new do |s|
  s.name             = 'SwizzleSwift'
  s.version          = '0.1'
  s.summary          = 'Swift swizzle made simple.'
  s.description      = <<-DESC
Change the implementation of selectors at runtime easily.
                       DESC
  s.swift_version = '5'
  s.homepage         = 'https://github.com/MarioIannotta/SwizzleSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MarioIannotta' => 'info@marioiannotta.com' }
  s.source           = { :git => 'https://github.com/MarioIannotta/SwizzleSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MarioIannotta'
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*'
end
