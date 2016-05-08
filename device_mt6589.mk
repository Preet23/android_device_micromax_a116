# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product-if-exists, vendor/mediatek/mt6589/mt6589-vendor.mk)

# MT6589 Required Overlays
DEVICE_PACKAGE_OVERLAYS += device/mediatek/mt6589/overlay

# MT6589 Device Path
LOCAL_PATH := device/mediatek/mt6589

# Prebuilt MT6589 Kernel
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

# MT6589 RamDisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.mt6589:root/fstab.mt6589 \
    $(LOCAL_PATH)/rootdir/init.mt6589.rc:root/init.mt6589.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6589.rc:root/init.recovery.mt6589.rc \
    $(LOCAL_PATH)/rootdir/init.mt6589.usb.rc:root/init.mt6589.usb.rc \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/rootdir/ueventd.mt6589.rc:root/ueventd.mt6589.rc \
    $(LOCAL_KERNEL):kernel

# MT6589 Wi-Fi
PRODUCT_PACKAGES += \
	wpa_supplicant

# MT6589 PowerVR Service Control
PRODUCT_PACKAGES += \
	pvrsrvctl

# MT6589 GSM
PRODUCT_PACKAGES += \
    gsm0710muxd \
    gsm0710muxdmd2

# MT6589 libcorkscrew
PRODUCT_PACKAGES += \
	libcorkscrew

# MT6589 USB Properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_mt6589
PRODUCT_DEVICE := mt6589

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

BOARD_SEPOLICY_DIRS := \
       device/mediatek/mt6589/sepolicy

BOARD_SEPOLICY_UNION := \
       app.te \
       device.te \
       domain.te \
       file_contexts \
       kernel.te \
       logwrapper.te \
       mtk_device.te \
       netd.te \
       pvrsrvctl.te \
       surfaceflinger.te \
       system.te \
       untrusted_app.te  

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
