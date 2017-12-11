Pod::Spec.new do |s|
  s.name         = "QW_Http"
  s.version      = "12.0.2.2"
  s.summary      = "QWKJ's http tool"
  s.homepage     = "https://github.com/hwzss/QW_Http"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { 'hwzss' => '1833361588@qq.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/hwzss/QW_Http.git",:tag => s.version }
  s.source_files =  'QW_Http/QW_Http/*.{h,m}'
  s.requires_arc = true
  s.dependency   'AFNetworking'
end

