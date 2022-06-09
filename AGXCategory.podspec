#
# Be sure to run `pod lib lint AGXCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AGXCategory'
  s.version          = '0.1.2'
  s.summary          = '所用一些分类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wq95230/AGXCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujf' => '952303557@qq.com' }
  s.source           = { :git => 'https://github.com/wq95230/AGXCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AGXCategory/Classes/AGCategory.h'
  s.public_header_files = 'AGXCategory/Classes/AGCategory.h'
  
  s.default_subspecs = 'NSString', 'NSDate', 'UIButtom','UIView','UITextView'
  s.frameworks = 'UIKit'

  #字符串分类
  s.subspec 'NSString' do |ss|
      ss.source_files = 'AGXCategory/Classes/NSString/*.{h,m}'
  end
  
  #日期分类
  s.subspec 'NSDate' do |ss|
      ss.source_files = 'AGXCategory/Classes/NSDate/*.{h,m}'
  end
  
  #按钮分类
  s.subspec 'UIButtom' do |ss|
      ss.source_files = 'AGXCategory/Classes/UIButtom/*.{h,m}'
  end
  
  #视图分类
  s.subspec 'UIView' do |ss|
      ss.source_files = 'AGXCategory/Classes/UIView/*.{h,m}'
  end
  
  #视图分类
  s.subspec 'UITextView' do |ss|
      ss.source_files = 'AGXCategory/Classes/UITextView/*.{h,m}'
  end
  
  # s.resource_bundles = {
  #   'AGXCategory' => ['AGXCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
