Pod::Spec.new do |s|
  s.name             = 'CVDNavigation'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CVDNavigation.'

  s.description      = 'A longer description of CVDNavigation'

  s.homepage         = 'https://github.com/Covitba/CVDNavigation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Covitba'
  s.source           = { :git => 'https://github.com/Covitba/CVDNavigation.git', :tag => s.version.to_s }

  s.platform         = :ios, '12.0'
  s.requires_arc     = true
  s.swift_version    = '5.0'

  s.source_files = 'CVDNavigation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CVDNavigation' => ['CVDNavigation/Assets/*.png']
  # }

  # s.dependency 'AFNetworking', '~> 2.3'
end
