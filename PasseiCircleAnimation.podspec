Pod::Spec.new do |s|
  s.name                  = 'PasseiCircleAnimation'
  s.version               = '0.0.2'
  s.summary               = 'Circle Animation'
  s.swift_version         = '5.0'
  s.description           = <<-DESC "Circle animation pod"
  Circle animation with percent
  DESC
  s.homepage              = 'https://github.com/ziminny/PasseiCircleAnimation'
  s.license               = { :type => 'PASSEI-GROUP', :file => 'LICENSE' }
  s.authors               = { 'Vagner Oliveira' => 'ziminny@gmail.com' }
  s.source                = { :git => 'https://github.com/ziminny/PasseiCircleAnimation.git', :tag => s.version.to_s }
  s.ios.deployment_target = '16.0'
  s.source_files          = 'PasseiCircleAnimation/Classes/**/*' 
  s.dependency 'PasseiLogManager'
  end