DEBUG=0
FINALPACKAGE=1
TARGET = iphone:clang:latest:8.0
include $(THEOS)/makefiles/common.mk

## Common frameworks ##
PROJ_COMMON_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AudioToolbox Security CoreGraphics AVFoundation Accelerate

export ARCHS=arm64 arm64e
TWEAK_NAME=CrackerXIPatch
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Application Support

include $(THEOS)/makefiles/bundle.mk

$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_LIBRARIES += substrate
include $(THEOS_MAKE_PATH)/tweak.mk
