Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'

  s.description      = 'A longer description of ${POD_NAME}'

  s.homepage         = 'https://github.com/Covitba/${POD_NAME}'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = '${USER_NAME}'
  s.source           = { :git => 'https://github.com/Covitba/${POD_NAME}.git', :tag => s.version.to_s }

  s.platform         = :ios, '12.0'
  s.requires_arc     = true
  s.swift_version    = '5.0'

  s.source_files = '${POD_NAME}/Classes/**/*'
  
  # s.resource_bundles = {
  #   '${POD_NAME}' => ['${POD_NAME}/Assets/*.png']
  # }

  # s.dependency 'AFNetworking', '~> 2.3'
end
