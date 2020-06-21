#
# Copyright (C) 2017 The LineAgeOS Project
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
#

$(call inherit-product, device/sony/common-treble/common.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PLATFORM_PATH := device/sony/yoshino-common

### PLATFORM INIT
PRODUCT_PACKAGES += \
    init.yoshino.usb \
    init.yoshino.pwr \
    init.yoshino.idd.rc \
    init.yoshino.qns.rc \
    idd.fstab \
    qns.fstab

DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_PATH)/overlay

include $(PLATFORM_PATH)/hardware/cne/cne.mk



# PERMISSIONS

# AR config for Play Store
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml

# RECOVERY
ifeq ($(WITH_TWRP),true)
# Add Timezone database
PRODUCT_COPY_FILES += \
    system/timezone/output_data/iana/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Add manifest for hwservicemanager
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/recovery/root/system/etc/vintf/manifest.xml:recovery/root/system/etc/vintf/manifest.xml \
    $(PLATFORM_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:recovery/root/vendor/etc/vintf/manifest.xml

else # WITH_TWRP
# VERITY
ifeq ($(WITH_VERITY),true)
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/1da4000.ufshc/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)
endif # WITH_VERITY

# AUDIO
PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.audio.effect@2.0-service \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.soundtrigger@2.0-service
    libvolumelistener \
    bthost_if

# Audio policy
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio_policy/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio_policy/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio_policy/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(PLATFORM_PATH)/config/audio_policy/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio_policy/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(PLATFORM_PATH)/config/audio_policy/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(PLATFORM_PATH)/config/audio_policy/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(PLATFORM_PATH)/config/audio_policy/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Listen configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml

# Audio configs
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(PLATFORM_PATH)/config/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(PLATFORM_PATH)/config/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(PLATFORM_PATH)/config/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Audio Effects
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \

# Audio Tuning
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(PLATFORM_PATH)/config/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt\

# Audio - MEDIA
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(PLATFORM_PATH)/config/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(PLATFORM_PATH)/config/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(PLATFORM_PATH)/config/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# CAMERA
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0-impl \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    libmmcamera_interface \
    libmmjpeg_interface \
    libmmlib2d_interface \
    libmm-qcamera \
    libqomx_core

# CONFIGSTORE
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# COVER
PRODUCT_PACKAGES += \
    FlipFlap

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.2-service.widevine

# FINGERPRINT
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service


# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.1

# GRAPHICS
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
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

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# HEALTH
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# IDC
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/system/idc/clearpad.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/clearpad.idc

# IMS
PRODUCT_PACKAGES += \
	ims-ext-common_system \
	ims-ext-common \
	qti-telephony-utils \
	qti_telephony_utils.xml \
        qti-telephony-hidl-wrapper \
        qti_telephony_hidl_wrapper.xml \
	qtiImsInCallUi \
	ConfURIDialer

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# KEYLAYOUT
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/system/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# LIGHT
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Live  DISPLAY
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/irqbalance/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# MEMTRACK
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service

# NFCSecureElement interface
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.0 \
	android.hardware.secure_element@1.1

# NFC - SECURE ELEMENT
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.0-service \
    SecureElement

# NFC
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(PLATFORM_PATH)/config/nfc/libnfc-nxp-octopus.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-octopus.conf \
    $(PLATFORM_PATH)/config/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# POWER
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service-qti

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/power/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# QTI low power whitelist
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/power/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# RADIO
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.radio@1.2 \
    android.hardware.radio.config@1.0

# RENDERSCRIPT
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl


# RIL
PRODUCT_PACKAGES += \
    libandroid_net


# SENSORS
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# THERMAL
PRODUCT_PACKAGES += \
    thermal.msm8998

# THERMAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.1-impl \
    android.hardware.thermal@1.0-service

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0 \
    android.hardware.usb@1.1 \
    android.hardware.usb@1.0-service

# USB TRUST HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# VIBRATOR
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# VR
PRODUCT_PACKAGES += \
    android.hardware.vr@1.0-impl \
    android.hardware.vr@1.0-service \
    vr.msm8998

# WEAVER
PRODUCT_PACKAGES += \
    android.hardware.weaver@1.0

# WIFI
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-impl \
    android.hardware.wifi@1.1-impl \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.offload@1.0

# WIFI DISPLAY
PRODUCT_PACKAGES += \
    vendor.display.config@1.3

# WIFI
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(PLATFORM_PATH)/config/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(PLATFORM_PATH)/config/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(PLATFORM_PATH)/config/wifi/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt

# WIFIDISPLAY
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/wfd/wfdconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/wfdconfig.xml

# Include MODEM (yoshino-common/hardware/modem)
include device/sony/yoshino-common/hardware/modem/Android.mk

PRODUCT_PACKAGES += \
	dump_miscta \
	ta_cust_version

# Modified init.qcom.early_boot.sh
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/init/init.qcom.early_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.early_boot.sh


include $(PLATFORM_PATH)/vendor_prop.mk
endif # WITH_TWRP
