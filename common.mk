# Copyright (C) 2015 The AOSParadox Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=0 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1\
    ro.adb.secure=1 \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    keyguard.no_require_sim=true \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.ril.enable.amr.wideband=1 \
    drm.service.enabled=true
    
# Packages
PRODUCT_PACKAGES += \
    SlimLauncher-Prebuilt \
    libemoji \
    LayersManager \
    SnapdragonCamera \
    SnapdragonAudio+

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/rnx/overlay/common

# Google DNS server
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Media effects
PRODUCT_COPY_FILES +=  \
    vendor/rnx/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/rnx/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# APN list
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
 
# Boot Animantion
PRODUCT_COPY_FILES += \
    vendor/rnx/prebuilt/common/media/RadonX-Bootanimation-1080.zip:system/media/bootanimation.zip

RNX_BUILD_ID := 6.0_Alpha-1

ifdef OFFICIAL_RNX_BUILD
  RNX_VERSION := RadonX-OFFICIAL-$(RNX_BUILD_ID)
else
  RNX_VERSION := UNOFFICIAL-$(TARGET_DEVICE)-$(shell date -u +%Y%m%d)
endif
PRODUCT_PROPERTY_OVERRIDES += \
	ro.rnx.version=$(RNX_VERSION)

# Install RadonOTA
#PRODUCT_PACKAGES += \
#	RadonOTA

# Inherit sabermod vendor
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk

# SuperSU
include vendor/rnx/prebuilt/common/SuperSU/supersu.mk

# Disable building with Jack
export ANDROID_COMPILE_WITH_JACK := false

$(call inherit-product-if-exists, vendor/extra/product.mk)
 
