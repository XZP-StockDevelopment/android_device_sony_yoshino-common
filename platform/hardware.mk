### GRAPHICS
PRODUCT_PACKAGES += \
    copybit.msm8998 \
    gralloc.msm8998 \
    hwcomposer.msm8998 \
    memtrack.msm8998 \
    libdisplayconfig \
    libhwc2on1adapter \
    libgenlock \
    liboverlay \
    libtinyxml \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan

PRODUCT_PACKAGES += \
    vendor.display.config@1.0

### AUDIO
PRODUCT_PACKAGES += \
    libvolumelistener \
    bthost_if

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Live  DISPLAY
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# SENSORS
PRODUCT_PACKAGES += \
    libsensorndkbridge

# THERMAL
PRODUCT_PACKAGES += \
    thermal.msm8998

# VR
PRODUCT_PACKAGES += \
    vr.msm8998

# USB TRUST HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# COVER
PRODUCT_PACKAGES += \
    FlipFlap
