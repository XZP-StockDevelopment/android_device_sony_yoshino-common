### CAMERA
PRODUCT_PACKAGES += \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmmlib2d_interface \
    libmm-qcamera \
    libqomx_core

## Extra SecureElement interface
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.0 \
	android.hardware.secure_element@1.1

## Include MODEM (yoshino-common/hardware/modem)
include device/sony/yoshino-common/hardware/modem/Android.mk

PRODUCT_PACKAGES += \
	dump_miscta \
	ta_cust_version

PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.radio.calls.on.ims=1 \
	persist.radio.calls.on.ims=1
