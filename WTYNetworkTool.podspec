#
# Be sure to run `pod lib lint WTYNetworkTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WTYNetworkTool'
  s.version          = '0.1.1'
  s.summary          = '基于Alamofire+RxSwift+HandyJSON封装的网络请求库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 基于Alamofire+RxSwift+HandyJSON封装的网络请求库.
                       DESC

  s.homepage         = 'https://github.com/LTY2009/WTYNetworkTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'litengyue117@163.com' => 'litengyue117@163.com' }
  s.source           = { :git => 'https://github.com/LTY2009/WTYNetworkTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'WTYNetworkTool/Classes/**/*'
  
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'HandyJSON', '~> 5.0.0-beta.1'
  s.dependency 'Alamofire', '~> 5.0.0-beta.6'
  
  # s.resource_bundles = {
  #   'WTYNetworkTool' => ['WTYNetworkTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
