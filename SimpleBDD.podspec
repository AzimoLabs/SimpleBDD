#
# Be sure to run `pod lib lint SimpleBDD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleBDD'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SimpleBDD.'


  s.description      = <<-DESC
	Simple BDD gives you possibiity to improve readability of your tests written in KIF. 
                       DESC

  s.homepage         = 'https://github.com/AzimoLabs/SimpleBDD'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'Przemysław Wośko' => 'przemek.wosko@azimo.com' }
  s.source           = { :git => 'https://github.com/AzimoLabs/SimpleBDD', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SimpleBDD/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SimpleBDD' => ['SimpleBDD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'XCTest'
  s.dependency 'KIF', '~> 3.4.2'
end
