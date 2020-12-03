#
# Be sure to run `pod lib lint widraugr2020.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'widraugr2020'
  s.version          = '0.1.0'
  s.summary          = 'A short description of widraugr2020.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This pod was created for educational purposes during the passage of pool 21.
                       DESC

  s.homepage         = 'https://github.com/MixFon/widraugr2020'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MixFon' => 'mixfon@rambler.ru' }
  s.source           = { :git => 'https://github.com/MixFon/widraugr2020.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'widraugr2020/Classes/**/*'
  s.resource = 'widraugr2020/Assets/*'
  
  # s.resource_bundles = {
  #   'widraugr2020' => ['widraugr2020/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
