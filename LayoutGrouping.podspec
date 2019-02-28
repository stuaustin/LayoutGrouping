Pod::Spec.new do |s|

  s.name          = 'LayoutGrouping'
  s.version       = '1.0.0'
  s.license       = 'MIT'
  s.summary       = 'Simple extension of Apple\'s AutoLayout anchors functionality'
  s.homepage     = 'https://github.com/stuaustin/LayoutGrouping'
  s.author       = 'Stuart Austin'
  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/stuaustin/LayoutGrouping.git', :tag => s.version}
  s.source_files  = ['LayoutGrouping/*.swift', 'LayoutGrouping/**/*.swift']

end