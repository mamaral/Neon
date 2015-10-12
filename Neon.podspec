Pod::Spec.new do |s|
  s.name = 'Neon'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'A powerful Swift programmatic UI layout framework.'
  s.homepage = 'https://github.com/mamaral/neon'
  s.social_media_url = 'http://twitter.com/MikeAmaral'
  s.authors = { 'Mike Amaral' => 'mike.amaral36@gmail.com' }
  s.source = { :git => 'https://github.com/mamaral/neon.git', :tag => "v0.0.1" }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Source/*.swift'
  end

  s.subspec 'ASDK' do |sp|
    sp.dependency 'AsyncDisplayKit', '~> 1.0'
    sp.source_files = 'Source/ASDK/*.swift'
  end
end
