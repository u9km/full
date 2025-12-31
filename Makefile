ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SovereignSecurity

# ملفاتك
SovereignSecurity_FILES = metalbiew.mm FarsiType.cpp

# المكتبات
SovereignSecurity_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore Metal MetalKit CoreText
SovereignSecurity_LIBRARIES = z c++ iconv

# إعدادات الكومبايلر
SovereignSecurity_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-function -I.

# ربط Dobby
SovereignSecurity_LDFLAGS += -L./ -ldobby

include $(THEOS_MAKE_PATH)/tweak.mk
