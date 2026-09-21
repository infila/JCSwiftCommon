Pod::Spec.new do |s|
  s.name             = 'JCSwiftCommon'
  s.version          = '2.0.0'
  s.summary          = 'Some common functions for Swift.'

  s.description      = 'SwiftCommon includes some commonly used and fundamental Swift methods. For example, extensions to certain system methods, some serialization and deserialization methods, and a very lightweight local storage tool which based on File system IO.'

  s.homepage         = 'https://github.com/infila/JCSwiftCommon.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James' => 'infilachen@gmail.com' }
  s.source           = { :git => 'https://github.com/infila/JCSwiftCommon.git', :tag => '2.0.0' }
  s.social_media_url = 'https://www.linkedin.com/in/jameschen5428'

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'

  s.subspec 'Common' do |common|
    common.source_files = 'JCSwiftCommon/Classes/Common/*'
    common.dependency 'JCSwiftCommon/Foundation+Ext'
  end

  s.subspec 'Foundation+Ext' do |f|
    f.source_files = 'JCSwiftCommon/Classes/Foundation+Ext/*'
  end

end
