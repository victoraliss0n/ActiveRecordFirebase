# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ActiveRecordFirebase' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
   use_frameworks!

   pod 'Firebase'
   pod 'Firebase/Auth'
   pod 'Firebase/Database'
   pod 'Firebase/Storage'
   pod 'SVProgressHUD', '~> 2.0'
   pod 'IQKeyboardManager', '~> 4.0'
   pod 'SCLAlertView', '~> 0.7'
   
   post_install do |installer|
       installer.pods_project.targets.each  do |target|
           target.build_configurations.each  do |config| config.build_settings['SWIFT_VERSION'] = '3.0'
           end
       end 
   end

end
