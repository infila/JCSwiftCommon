#
# Be sure to run `pod lib lint JCSwiftCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCSwiftCommon'
  s.version          = '1.0.0'
  s.summary          = 'Some common functions for Swift.'

  s.description      = 'SwiftCommon includes some commonly used and fundamental Swift methods. For example, extensions to certain system methods, some serialization and deserialization methods, and a very lightweight local storage tool which based on File system IO.'

  s.homepage         = 'https://github.com/infila/JCSwiftCommon.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James' => 'infilachen@gmail.com' }
  s.source           = { :git => 'https://github.com/infila/JCSwiftCommon.git', :tag => '1.0.0' }
  s.social_media_url = 'https://www.linkedin.com/in/jameschen5428'

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'

#  s.source_files = 'JCSwiftCommon/Classes/**/*'

  s.subspec 'Common' do |common|
    common.source_files = 'JCSwiftCommon/Classes/Common/*'
    common.dependency 'JCSwiftCommon/Foundation+Ext'
  end

  s.subspec 'Foundation+Ext' do |f|
    f.source_files = 'JCSwiftCommon/Classes/Foundation+Ext/*'
  end
  
  # s.resource_bundles = {
  #   'JCSwiftCommon' => ['JCSwiftCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
