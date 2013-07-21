dresseria
=========

dresseria

Instructions to configure project
---------------------------------

Davids-MacBook-Pro:node dbeilis$ cd ~
Davids-MacBook-Pro:~ dbeilis$ sys_rb_usr=/System/Library/Frameworks/Ruby.framework/Versions/2.0/usr
Davids-MacBook-Pro:~ dbeilis$ sdk_rb_usr=`xcode-select -p`/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/Ruby.framework/
Davids-MacBook-Pro:~ dbeilis$ sudo cp -r $sdk_rb_usr/include $sys_rb_usr/include
Password:
cp: /Applications/Xcode5-DP2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/Ruby.framework//include: No such file or directory
Davids-MacBook-Pro:~ dbeilis$ sudo gem install cocoapods

Davids-MacBook-Pro:dresseria dbeilis$ pod setup
Setting up CocoaPods master repo
Already up-to-date.
Setup completed (read-only access)
Davids-MacBook-Pro:dresseria dbeilis$ pod install
Analyzing dependencies
Downloading dependencies
Installing AFNetworking (1.3.1)
Generating Pods project
Integrating client project
Davids-MacBook-Pro:dresseria dbeilis$ ls
Dresseria		Dresseria.xcworkspace	Podfile			Pods
Dresseria.xcodeproj	DresseriaTests		Podfile.lock		README.md
Davids-MacBook-Pro:dresseria dbeilis$ open Dresseria.xcworkspace/
Davids-MacBook-Pro:dresseria dbeilis$ 

Adding libraries
----------------

update Podfile wih libraries