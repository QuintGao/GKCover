Pod::Spec.new do |s|
  s.name         = "GKCover"
  s.version      = "2.4.8"
  s.summary      = "一行代码显示遮罩视图，让你的弹窗更easy!"
  s.homepage     = "https://github.com/QuintGao/GKCover"
  s.license      = "MIT"
  s.authors      = { "高坤" => "1094887059@qq.com" }
  s.social_media_url   = "https://github.com/QuintGao"
  s.platform     = :ios, "6.0"
  s.ios.deployment_target = '6.0'
  s.source       = { :git => "https://github.com/QuintGao/GKCover.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'GKCover/**/*.{h,m}'
  s.public_header_files = 'GKCover/**/*.{h}'
  s.frameworks   = "Foundation", "UIKit"

end
