PRODUCT_BRAND ?= RadonX

# Use RadonX Bootanimation
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/rnx/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/rnx/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/rnx/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/rnx/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/etc/init.local.rc:root/init.omni.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Dashclock
#PRODUCT_COPY_FILES += \
#    vendor/rnx/prebuilt/app/DashClock.apk:system/app/DashClock.apk

# SlimLauncher
PRODUCT_PACKAGES += \
    SlimLauncher-Prebuilt

# Snapdragon Audio+
PRODUCT_PACKAGES += \
    SnapdragonAudio+

# Additional packages
-include vendor/rnx/config/packages.mk

# Versioning
-include vendor/rnx/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/rnx/overlay/common

# Add SuperSU to build
include vendor/rnx/prebuilt/SuperSU/supersu.mk

ifdef OFFICIAL_RNX_BUILD
  SM_VENDOR := vendor/sm
  include $(SM_VENDOR)/Main.mk
endif

# Disable building with Jack
export ANDROID_COMPILE_WITH_JACK := false
