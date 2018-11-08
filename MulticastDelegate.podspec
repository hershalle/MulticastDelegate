#
# Be sure to run `pod lib lint AppLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'MulticastDelegate'
  spec.version          = '0.1.0'
  spec.summary          = 'A simple multicast delegate'

  spec.description      = <<-DESC
A simple multicast delegate.
                       DESC

  spec.homepage         = 'https://github.com/hershalle/MulticastDelegate.git'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'hershalle' => 'hershalle@gmail.com' }
  spec.social_media_url = 'https://twitter.com/hershalle'
    
  spec.ios.deployment_target = '11.0'
  spec.swift_version   = '4.2'
  spec.source          = { :git => 'https://github.com/hershalle/MulticastDelegate.git' , :tag => spec.version.to_s }
  spec.source_files = "Sources"
    

end
