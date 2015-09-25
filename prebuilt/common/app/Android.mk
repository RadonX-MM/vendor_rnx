LOCAL_PATH := $(call my-dir)

# Install Bitsyko Layers Manager
include $(CLEAR_VARS)
LOCAL_MODULE := LayersManager
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_PATH := $(TARGET_OUT)/app
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Install Snap by xboxfanj
include $(CLEAR_VARS)
LOCAL_MODULE := Snap
LOCAL_OVERRIDES_PACKAGES := Camera Camera2
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_PATH := $(TARGET_OUT)/app
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
