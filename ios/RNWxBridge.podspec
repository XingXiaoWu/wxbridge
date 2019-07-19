
Pod::Spec.new do |s|
  s.name         = "RNWxBridge"
  s.version      = "1.0.0"
  s.summary      = "RNWxBridge"
  s.description  = <<-DESC
                  RNWxBridge
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "wuxing" => "329106954@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNWxBridge.git", :tag => "master" }
  s.source_files  = "RNWxBridge/**/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  