Pod::Spec.new do |spec|
  spec.name             = 'ServiceKit'
  spec.version          = '1.0.0.7'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/'
  spec.summary          = 'To ServiceKit pods'
  spec.author       = 'Srikanth'

  # spec.source           = { :path => "/Users/srikanth/Desktop/Github/ServiceKit/" }
  spec.source           = { :path => "https://github.com/rongalis/ServiceKit.git", :branch => "development" }
  spec.source_files = "ServiceKit/**/*{.h,.swift}"
  spec.exclude_files =  "ServiceKit/ServiceKit.podspec"
  spec.framework = "ServiceKit"
  spec.vendored_framework = 'lib/ServiceKit.xcframework'
  spec.resource_bundles = {
   "ServiceKit" => ["ServiceKit/**/*.{storyboard, xib, nib, xcassets}"]
}
spec.pod_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
spec.user_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
end
