Pod::Spec.new do |s|
  s.name = 'Neon'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = 'A powerful Swift programmatic UI layout framework.'
  s.homepage = 'https://github.com/mamaral/neon'
  s.social_media_url = 'http://twitter.com/MikeAmaral'
  s.authors = { 'Mike Amaral' => 'mike.amaral36@gmail.com' }
  s.source = { :git => 'https://github.com/mamaral/neon.git', :tag => "v0.0.2" }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
  s.requires_arc = true
end
