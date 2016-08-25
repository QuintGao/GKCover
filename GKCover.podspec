Pod::Spec.new do |s|
  s.name         = "GKCover"
  s.version      = "1.0.0"
  s.summary      = "A cover for iOS."
  s.description  = <<-DESC
	A cover for ios system and can custom it!
                   DESC

  s.homepage     = "https://github.com/QuintGao/GKCover"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT"
  # Or just: s.author    = "高坤"
  s.author            = { "高坤" => "1094887059@qq.com" }
  # s.social_media_url   = "http://twitter.com/高坤"
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/QuintGao/GKCover.git", :tag => "1.0.0" }
  s.source_files = 'GKCover/*','GKCover/**/*.h'
  s.public_header_files = 'GKCover/**/*.h'
  s.exclude_files = "Classes/Exclude"

  # s.framework  = "SomeFramework"
  s.frameworks = "Foundation", "UIKit"


end
