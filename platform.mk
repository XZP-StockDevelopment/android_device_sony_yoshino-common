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


### PERMISSIONS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.audio.pro.xml

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/permissions/privapp-permissions-fdroid.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-fdroid.xml \
    $(PLATFORM_PATH)/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(PLATFORM_PATH)/config/permissions/privapp-permissions-sony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-sony.xml

PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/permissions/semccamera-default-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/semccamera-default-permissions.xml

# Hotword
PRODUCT_COPY_FILES += \
	$(PLATFORM_PATH)/config/permissions/hotword-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hotword-hiddenapi-package-whitelist.xml \
	$(PLATFORM_PATH)/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-hotword.xml


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
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

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
    android.hardware.soundtrigger@2.0-service \
    libvolumelistener \
    bthost_if

### AUDIO
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    android.hardware.bluetooth.a2dp@1.0 \
    android.hardware.bluetooth.audio@2.0 \
    android.hardware.bluetooth.audio@2.0-impl


### AUDIO
# For audio.primary
PRODUCT_PACKAGES += \
    libaudio-resampler \
    libaudioroute \
    libaudioutils \
    libtinyalsa \
    libtinycompress_vendor \
    tinymix

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle \
    libvolumelistener


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

### BLUETOOTH
PRODUCT_PACKAGES += \
    libbt-vendor


### CAMERA
#PRODUCT_PACKAGES += \
    Snap


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

### CHARGER
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support (CNE)
PRODUCT_PACKAGES += \
    cneapiclient \
    com.quicinc.cne \
    services-ext

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


# GPS / Location
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.0-impl-qti \
    android.hardware.gnss@2.0-service-qti \
    libbatching \
    libgeofencing \
    libgnss \
    libgnsspps \
    libsynergy_loc_api


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
    vendor.display.config@1.9 \
    vendor.display.config@1.9_vendor

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
        ims_ext_common.xml \
        qti-telephony-utils \
	qti_telephony_utils.xml \
        qti-telephony-hidl-wrapper \
        qti_telephony_hidl_wrapper.xml \

PRODUCT_BOOT_JARS += \
    ims-ext-common_system

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IPV6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

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

### MEDIA
PRODUCT_PACKAGES += \
    libqdMetaData.system

### NETMGR
PRODUCT_PACKAGES += \
    librmnetctl

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1-service \
    android.hardware.secure_element@1.0 \
    android.hardware.secure_element@1.1 \
    android.hardware.secure_element@1.0-service \
    SecureElement \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    vendor.nxp.nxpese@1.0:64 \
    vendor.nxp.nxpnfc@1.0:64
  
# NFC
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(PLATFORM_PATH)/config/nfc/libnfc-nxp-octopus.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-octopus.conf \
    $(PLATFORM_PATH)/config/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf


### OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libc2dcolorconvert \
    libmm-omxcore \
    libstagefrighthw

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
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.0

# RENDERSCRIPT
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

### RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

### RIL
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# RIL
PRODUCT_PACKAGES += \
    libandroid_net

# SENSORS
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

### SYSTEM LIBS
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libjson \
    libion \
    libminijail \
    libstdc++.vendor \
    libtinyxml \
    libxml2

### TELEPHONY
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

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

# VNDK
PRODUCT_PACKAGES += \
    vndk_package \
    vndk-sp

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

### WIFI
PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    p2p_supplicant.conf \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

# WIFI
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(PLATFORM_PATH)/config/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(PLATFORM_PATH)/config/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(PLATFORM_PATH)/config/wifi/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt

# WIFIDISPLAY
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/wfd/wfdconfig.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/wfdconfig.xml

# WIFI DISPLAY
PRODUCT_PACKAGES += \
    libaacwrapper \
    libnl \
    libmediaextractorservice

PRODUCT_BOOT_JARS += \
    WfdCommon

# Modified init.qcom.early_boot.sh
PRODUCT_COPY_FILES += \
    $(PLATFORM_PATH)/config/init/init.qcom.early_boot.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.early_boot.sh


include $(PLATFORM_PATH)/vendor_prop.mk
endif # WITH_TWRP
