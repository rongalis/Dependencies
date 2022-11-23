Pod::Spec.new do |spec|
  spec.name             = 'ServiceKit'
  spec.version          = '1.0.0.7'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/'
  spec.summary          = 'To ServiceKit pods'
  spec.author       = 'Srikanth'

  # spec.source           = { :path => "ServiceKit/" }
  spec.source           = { :path => "https://github.com/rongalis/ServiceKit.git", :branch => "development" }
  spec.source_files = "ServiceKit/**/*{.h,.swift}"
  spec.exclude_files =  "ServiceKit/ServiceKit.podspec"
end
