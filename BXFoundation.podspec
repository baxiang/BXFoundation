

Pod::Spec.new do |s|
  s.name             = 'BXFoundation'
  s.version          = '0.1.0'
  s.summary          = 'iOS  Foundation.'
  s.description      = 'Foundation快速开发框架'
  s.homepage         = 'https://github.com/baxiang/BXFoundation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'baxiang' => 'baxiang1989@163.com' }
  s.source           = { :git => 'https://github.com/baxiang/BXFoundation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'BXFoundation/Classes/**/*'
  
end
