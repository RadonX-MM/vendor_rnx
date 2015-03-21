# Inherit common stuff
$(call inherit-product, vendor/aosparadox/config/common.mk)

# Include LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aosparadox/overlay/dictionaries

# Optional packages
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

# Extra tools
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar
