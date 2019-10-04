Pod::Spec.new do |s|
  s.name             = 'SwizzleSwift'
  s.version          = '1.0'
  s.summary          = 'Swizzle selectors with just one clean and elegant API.'
  s.description      = <<-DESC
Who said that method swizzling needs to look ugly? SwizzleSwift is a little wrapper that lets you swizzle selectors just one clean and elegant API.
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
