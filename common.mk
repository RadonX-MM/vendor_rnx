PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Boot Animantion
ifneq ($(filter falcon titan,$(TARGET_DEVICE)),)
PRODUCT_COPY_FILES += \
    vendor/aosparadox/prebuilt/common/media/AOSParadox_720_bootanimation.zip:system/media/bootanimation.zip
endif
ifneq ($(PRODUCT_DEVICE),bacon)
PRODUCT_COPY_FILES += \
    vendor/aosparadox/prebuilt/common/media/AOSParadox_1080_bootanimation.zip:system/media/bootanimation.zip
endif

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosparadox/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/aosparadox/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aosparadox/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Misc packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LatinIME \
    Launcher3 \
    libemoji \
    Terminal

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# Live Wallpapers and more Daydream packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Mms \
    Stk

# Mms depends on SoundRecorder for recorded audio messages
PRODUCT_PACKAGES += \
    SoundRecorder

# World APN list
PRODUCT_COPY_FILES += \
    vendor/aosparadox/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/aosparadox/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Overlays & Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/aosparadox/overlay/common \
	vendor/aosparadox/overlay/dictionaries

# AOSParadox Version
PAR_VERSION := $(TARGET_DEVICE)-$(shell date -u +%Y%m%d)
PRODUCT_PROPERTY_OVERRIDES += ro.par.version =$(PAR_VERSION)

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

$(call inherit-product-if-exists, vendor/extra/product.mk)
