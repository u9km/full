TARGET = iphone:clang:latest:14.5
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

TWEAK_NAME = SovereignSecurity

# تجميع الملفات كلها "ياخذها من كل مكان"
SovereignSecurity_FILES = $(wildcard *.mm) $(wildcard *.m) $(wildcard *.cpp) \
                          $(wildcard HOST7/*.m) \
                          $(wildcard KittyMemory/*.cpp) \
                          $(wildcard AntiBan/*.mm)

# المكتبات المطلوبة
SovereignSecurity_LIBRARIES = substrate z c++
SovereignSecurity_FRAMEWORKS = UIKit Foundation Security AVFoundation CoreGraphics CoreText SystemConfiguration CoreTelephony WebKit MetalPerformanceCore

# إعدادات لطيفة تخلي النظام يتجاهل الأخطاء البسيطة
SovereignSecurity_CFLAGS += -I. -I./HOST7 -I./KittyMemory -I./AntiBan -fobjc-arc -w -Wno-error
SovereignSecurity_CCFLAGS += -std=c++17 -I. -I./HOST7 -I./KittyMemory -I./AntiBan -w -Wno-error
SovereignSecurity_LDFLAGS += -F. -framework MetalPerformanceCore

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
