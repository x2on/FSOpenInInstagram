Pod::Spec.new do |s|
  s.name         = "FSOpenInInstagram"
  s.version      = "1.0"
  s.summary      = "FSOpenInInstagram is a tool for sending pictures with the Instagram iOS App."
  s.homepage     = "https://github.com/x2on/FSOpenInInstagram"
  s.social_media_url = 'https://twitter.com/x2on'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Felix Schulze" => "mail@felixschulze.de" }
  s.source       = {
    :git => "https://github.com/x2on/FSOpenInInstagram.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'FSOpenInInstagram.{h,m}'
  s.framework	 = 'Foundation'
end