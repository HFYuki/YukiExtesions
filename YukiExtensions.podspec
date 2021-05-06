
# 参考来源：https://github.com/CaamDau

Pod::Spec.new do |s|
  s.name             = 'YukiExtensions'
  s.version          = '0.1.0'
  s.summary          = 'YukiExtensions常用扩展'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HFYuki/YukiExtesions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '792115885@qq.com' => '792115885@qq.com' }
  s.source           = { :git => 'https://github.com/HFYuki/YukiExtesions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.swift_version = ['4.0', '4.2', '5.0', '5.1']
  s.source_files = 'YukiExtensions/Classes/**/*'
  
  # s.default_subspec = 'Core'

  # s.subspec 'Core' do |core|
    
  #   core.source_files = 'YukiExtensions/Classes/Core/**/*'
  # end
  
  s.dependency 'YukiCompatible'
  s.dependency 'YukiValue'
  s.frameworks = 'UIKit', 'Foundation'
# end
end
