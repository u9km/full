export THEOS=/var/mobile/theos

ARCHS = arm64
#Add arm64e if it needed
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1 
THEOS_PACKAGE_SCHEME = rootless
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = App


App_FRAMEWORKS = IOKit  UIKit Foundation Security QuartzCore CoreGraphics CoreText  AVFoundation Accelerate GLKit SystemConfiguration GameController

App_CCFLAGS = -w -std=gnu++14 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c

App_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-variable -Wno-format-security -I./AFNetworking -I./CocoaAsyncSocket -I./Core -I./Core/Categories -I./Core/Mime -I./Core/Responses -I./EasyAES -I./MBProgressHUD -I./SAMKeychain -I./SCLAlertView -I./UDID 

App_FILES = $(wildcard ESP/*.mm) $(wildcard ESP/*.m) $(wildcard *.mm) $(wildcard ESP/*.cpp) $(wildcard ESP/imgui/*.mm) $(wildcard ESP/imgui/*.cpp) $(wildcard SDK/*.cpp) $(wildcard ESP/防禁令/*.mm)  $(wildcard ESP/HOST/*.m)   


# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk
