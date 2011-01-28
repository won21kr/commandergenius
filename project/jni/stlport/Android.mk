LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := stlport

ifneq ($(CRYSTAX_TOOLCHAIN)$(NDK_R5_TOOLCHAIN),)
LOCAL_CPP_EXTENSION := .cpp
LOCAL_SRC_FILES := dummy.c
else
LOCAL_CFLAGS := -O3 -I$(LOCAL_PATH)/stlport -I$(LOCAL_PATH)/src -DANDROID_NO_COUT=1 -frtti -fexceptions

LOCAL_CPP_EXTENSION := .cpp
LOCAL_SRC_FILES := $(addprefix src/,$(notdir $(wildcard $(LOCAL_PATH)/src/*.cpp $(LOCAL_PATH)/src/*.c)))
endif

include $(BUILD_STATIC_LIBRARY)
