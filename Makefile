ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SovereignSecurity

# بناء ملفاتك الخاصة فقط
SovereignSecurity_FILES = metalbiew.mm FarsiType.cpp

# المكتبات الضرورية (تمت إضافتها بناءً على اسم metalbiew)
SovereignSecurity_FRAMEWORKS = UIKit Foundation CoreGraphics QuartzCore Metal MetalKit CoreText
SovereignSecurity_LIBRARIES = z c++

# إعدادات التجميع (تجاهل الأخطاء لضمان خروج الملف)
SovereignSecurity_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-function

# ربط مكتبة Dobby
SovereignSecurity_LDFLAGS += -L./ -ldobby

include $(THEOS_MAKE_PATH)/tweak.mk
