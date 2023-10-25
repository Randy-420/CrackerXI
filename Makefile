DEBUG=0
FINALPACKAGE=1
TARGET = iphone:clang:latest:8.0
include $(THEOS)/makefiles/common.mk

export ARCHS=arm64 arm64e
TWEAK_NAME=CrackerXIPatch
$(TWEAK_NAME)_FILES = Tweak.xm

$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_LIBRARIES += substrate
include $(THEOS_MAKE_PATH)/tweak.mk
