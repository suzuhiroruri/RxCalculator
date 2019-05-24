# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

inhibit_all_warnings!
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!
enable_bitcode_for_prebuilt_frameworks!

def install_pods
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftLint'
  pod 'R.swift', '~> 5.0'
  pod 'RxSwift',    '~> 4.4.0'
  pod 'RxCocoa',    '~> 4.4.0'
  pod 'UIGradient', '~> 1.3.1'
end


target 'RxCalculator' do
  install_pods
end