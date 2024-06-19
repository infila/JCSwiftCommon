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
  s.summary          = 'Some common functions of Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'JCSwiftCommon has some common functions of Swift, includes some useful extensions.'

  s.homepage         = 'https://github.com/infila/JCSwiftCommon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James' => 'infilachen@gmail.com' }
  s.source           = { :git => 'https://github.com/infila/JCSwiftCommon', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'JCSwiftCommon/Classes/**/*'

  s.subspec 'Common' do |common|
	common.source_files = 'JCSwiftCommon/Classes/Common/**/*'
  end

  s.subspec 'Foundation+Ext' do |f|
	f.source_files = 'JCSwiftCommon/Classes/Foundation+Ext/**/*'
  end

  s.subspec 'SwiftUI+Ext' do |ui|
	ui.source_files = 'JCSwiftCommon/Classes/SwiftUI+Ext/**/*'
  end
  
  # s.resource_bundles = {
  #   'JCSwiftCommon' => ['JCSwiftCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
