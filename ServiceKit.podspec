Pod::Spec.new do |spec|
  spec.name             = 'ServiceKit'
  spec.version          = '1.0.1'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/'
  spec.summary          = 'To ServiceKit pods'
  spec.author       = 'Srikanth'

   spec.source           = { :path => "/Users/srikanth/Desktop/Github/ServiceKit/lib/ServiceKit.xcframework.zip" }
  # spec.source           = { :http => "https://github.com/rongalis/ServiceKit/raw/development/lib/ServiceKit.xcframework.zip" }
  # spec.source           = { :http => "https://github.com/rongalis/ServiceKit.git", :branch => "development" }
  

  # spec.source_files = "ServiceKit/**/*{.h,.swift}"
  # spec.exclude_files =  "ServiceKit/ServiceKit.podspec"
  # spec.framework = 'ServiceKit'
  spec.vendored_frameworks = "ServiceKit.xcframework"
  # spec.preserve_paths = 'ServiceKit/ServiceKit.framework'
  # spec.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$PROJECT_DIR"/Pods/ServiceKit/ServiceKit.framework' }
#   spec.resource_bundles = {
#    "ServiceKit" => ["ServiceKit/**/*.{storyboard, xib, nib, xcassets}"]
# }
spec.pod_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
spec.user_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
end
