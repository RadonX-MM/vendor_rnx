# Versioning of the ROM

RNX_BUILD_ID := 6.0.1_Alpha-1

ifdef OFFICIAL_RNX_BUILD
  RNX_VERSION := RadonX-OFFICIAL-$(RNX_BUILD_ID)
else
  RNX_VERSION := UNOFFICIAL-$(TARGET_DEVICE)-$(shell date -u +%Y%m%d)
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=RadonX-$(RNX_VERSION) \
    ro.rnx.version=$(RNX_VERSION)

ROM_VERSION := $(RNX_VERSION)

